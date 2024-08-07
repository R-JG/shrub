let rope
let pith
let path
let ship
let app
let channelMessageId
let subscriptionId
let eventSource
const channelId = `${Date.now()}${Math.floor(Math.random() * 100)}`
const channelPath = `${window.location.origin}/~/channel/${channelId}`
addEventListener('DOMContentLoaded', async () => {
  channelMessageId = 0
  rope = Number(document.documentElement.getAttribute('rope'))
  pith = document.documentElement.getAttribute('pith')
  path = document.documentElement.getAttribute('path')
  ship = document.documentElement.getAttribute('ship')
  app = document.documentElement.getAttribute('app')
  await connectToShip()
  let eventElements = document.querySelectorAll('[event]')
  eventElements.forEach((el) => setEventListeners(el))
})
async function connectToShip() {
  const storageKey = `${rope}${ship}`
  let storedStr = localStorage.getItem(storageKey)
  localStorage.setItem(storageKey, `${channelMessageId} ${channelId}`)
  if (storedStr) {
    const storedIds = storedStr.split(' ')
    const oldPath = `${window.location.origin}/~/channel/${storedIds[1]}`
    fetch(oldPath, {
      method: 'PUT',
      body: JSON.stringify([
        {
          id: channelMessageId,
          action: 'unsubscribe',
          subscription: Number(storedIds[0])
        },
        {
          id: channelMessageId++,
          action: 'delete'
        }
      ])
    })
  }
  await fetch(channelPath, {
    method: 'PUT',
    body: JSON.stringify(makeSubscribeBody(channelMessageId))
  })
  eventSource = new EventSource(channelPath)
  eventSource.addEventListener('message', handleChannelStream)
}
function setEventListeners(el) {
  const eventAttrVals = el.getAttribute('event')
  const returnAttrVals = el.getAttribute('return')
  const throttleMs = Number(el.getAttribute('throttle')) * 1000
  const debounceMs = Number(el.getAttribute('debounce')) * 1000
  eventAttrVals.split(/\s+/).forEach((eventAttr) => {
    let splitEventAttr = eventAttr.split('/')
    if (splitEventAttr[0] === '') splitEventAttr.shift()
    const eventType = splitEventAttr[0]
    if (throttleMs) {
      el[`on${eventType}`] = pokeThrottle(
        throttleMs,
        eventType,
        eventAttr,
        returnAttrVals
      )
    } else if (debounceMs) {
      el[`on${eventType}`] = pokeDebounce(
        debounceMs,
        eventType,
        eventAttr,
        returnAttrVals
      )
    } else {
      el[`on${eventType}`] = (e) =>
        pokeShip(e, e.currentTarget, eventType, eventAttr, returnAttrVals)
    }
  })
}
function pokeThrottle(ms, ...pokeArgs) {
  let ready = true
  return (e) => {
    if (!ready) return
    ready = false
    window.setTimeout(() => {
      ready = true
    }, ms)
    pokeShip(e, e.currentTarget, ...pokeArgs)
  }
}
function pokeDebounce(ms, ...pokeArgs) {
  let timeoutId = null
  return (e) => {
    window.clearTimeout(timeoutId)
    timeoutId = window.setTimeout(() => pokeShip(e, e.target, ...pokeArgs), ms)
  }
}
function pokeShip(event, target, eventType, eventAttr, returnAttrVals) {
  const jsOnEvent = target.getAttribute('js-on-event')
  if (jsOnEvent) {
    eval?.(`"use strict"; ${jsOnEvent}`)
  }
  let uiEventData = {}
  if (returnAttrVals) {
    uiEventData = handleReturnAttr(event, target, returnAttrVals)
  }
  if (eventType === 'submit') {
    event.preventDefault()
    const formData = new FormData(target)
    formData.forEach((v, k) => {
      uiEventData[k] = v
    })
    target.reset()
  }
  fetch(channelPath, {
    method: 'PUT',
    body: JSON.stringify(
      makePokeBody({
        rope,
        path: eventAttr,
        data: uiEventData
      })
    )
  })
}
function handleReturnAttr(event, target, returnAttrVals) {
  let returnData = {}
  returnAttrVals.split(/\s+/).forEach((returnAttr) => {
    let splitReturnAttr = returnAttr.split('/')
    if (splitReturnAttr[0] === '') splitReturnAttr.shift()
    const returnObjSelector = splitReturnAttr[0]
    const key = splitReturnAttr[1]
    if (returnObjSelector === 'event') {
      if (!(key in event)) {
        console.error(`Property: ${key} does not exist on the event object`)
        return
      }
      returnData[returnAttr] = String(event[key])
    } else {
      let returnObj
      if (returnObjSelector === 'target') {
        returnObj = target
      } else {
        const linkedEl = document.getElementById(returnObjSelector)
        if (!linkedEl) {
          console.error(`No element found for id: ${returnObjSelector}`)
          return
        }
        returnObj = linkedEl
      }
      if (key.startsWith('data')) {
        const dataKey = key
          .substring(5)
          .split('-')
          .map((w, i) => {
            if (i === 0) {
              return w.toLowerCase()
            } else {
              return w.charAt(0).toUpperCase() + w.slice(1).toLowerCase()
            }
          })
          .join('')
        if (!returnObj.dataset.hasOwnProperty(dataKey)) {
          console.error(
            `Property: ${dataKey} does not exist on the specified object`
          )
          return
        }
        returnData[returnAttr] = String(returnObj.dataset[dataKey])
      } else {
        if (!(key in returnObj)) {
          console.error(
            `Property: ${key} does not exist on the specified object`
          )
          return
        }
        // TODO: handle other properties that don't cast to string
        returnData[returnAttr] = String(returnObj[key])
      }
    }
  })
  return returnData
}
function handleChannelStream(event) {
  const streamResponse = JSON.parse(event.data)
  fetch(channelPath, {
    method: 'PUT',
    body: JSON.stringify(makeAck(streamResponse.id))
  })
  if (streamResponse.response !== 'diff') return
  const gust = streamResponse.json
  if (!gust) return
  // console.log(gust);
  gust.forEach((gustObj) => {
    switch (gustObj.p) {
      case 'd':
        gustObj.q.forEach((key) => {
          let toRemove = document.querySelector(`[key="${key}"]`)
          const jsOnDelete = toRemove.getAttribute('js-on-delete')
          if (jsOnDelete) {
            eval?.(`"use strict"; ${jsOnDelete}`)
          }
          toRemove.remove()
        })
        break
      case 'n':
        let parent = document.querySelector(`[key="${gustObj.q}"]`)
        if (gustObj.r === 0) {
          parent.insertAdjacentHTML('afterbegin', gustObj.s)
        } else if (gustObj.r === parent.childNodes.length) {
          parent.insertAdjacentHTML('beforeend', gustObj.s)
        } else {
          let indexTarget = parent.childNodes[gustObj.r]
          if (indexTarget.nodeType === 1) {
            indexTarget.insertAdjacentHTML('beforebegin', gustObj.s)
          } else {
            let placeholder = document.createElement('div')
            parent.insertBefore(placeholder, indexTarget)
            placeholder = parent.childNodes[gustObj.r]
            placeholder.outerHTML = gustObj.s
          }
        }
        let newNode = parent.childNodes[gustObj.r]
        if (newNode.getAttribute('event')) {
          setEventListeners(newNode)
        }
        if (newNode.childElementCount > 0) {
          let needingListeners = newNode.querySelectorAll('[event]')
          needingListeners.forEach((child) => setEventListeners(child))
        }
        const jsOnAdd = newNode.getAttribute('js-on-add')
        if (jsOnAdd) {
          eval?.(`"use strict"; ${jsOnAdd}`)
        }
        break
      case 'm':
        let fromNode = document.querySelector(`[key="${gustObj.q}"]`)
        const fromIndex = [...fromNode.parentNode.childNodes].indexOf(fromNode)
        if (fromIndex < gustObj.r) gustObj.r++
        let toNode = fromNode.parentNode.childNodes[gustObj.r]
        fromNode.parentNode.insertBefore(fromNode, toNode)
        break
      case 'c':
        let targetNode = document.querySelector(`[key="${gustObj.q}"]`)
        if (gustObj.r.length) {
          gustObj.r.forEach((attr) => {
            if (attr === 'event') {
              let eventVal = targetNode.getAttribute('event').split('/')
              if (eventVal[0] === '') eventVal.shift()
              const eventType = eventVal[0]
              targetNode[`on${eventType}`] = null
            }
            targetNode.removeAttribute(attr)
          })
        }
        if (gustObj.s.length) {
          gustObj.s.forEach((attr) => {
            const name = attr[0]
            const value = attr[1]
            targetNode.setAttribute(name, value)
            if (name === 'event') setEventListeners(targetNode)
          })
        }
        break
      case 't':
        let textWrapperNode = document.querySelector(`[key="${gustObj.q}"]`)
        textWrapperNode.textContent = gustObj.r
        break
    }
  })
}
function makeSubscribeBody(channelMessageId) {
  return [
    {
      id: channelMessageId,
      action: 'subscribe',
      ship: ship,
      app: app,
      path: path
    }
  ]
}
function makePokeBody(jsonData) {
  channelMessageId++
  return [
    {
      id: channelMessageId,
      action: 'poke',
      ship: ship,
      app: app,
      mark: 'json',
      json: { pith: pith, data: jsonData }
    }
  ]
}
function makeAck(eventId) {
  channelMessageId++
  return [
    {
      id: channelMessageId,
      action: 'ack',
      'event-id': eventId
    }
  ]
}
