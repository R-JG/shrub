/@  ui-event
/@  comment
/-  su=shrub-utils
^-  kook:neo
=<
|%
++  state  pro/%manx
++  poke   (sy %ui-event %rely ~)
++  kids   *kids:neo
++  deps
  ^-  deps:neo
  %-  my
  :~  :^  %src  |  [pro/%comments (sy %meta-diff ~)]
      ~
  ==
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =pail:neo]
  ::
  ++  init
    |=  pal=(unit pail:neo)
    ^-  (quip card:neo pail:neo)
    =/  meta=(pair pith:neo lore:neo)  (~(got by deps.bowl) %src)
    ?~  (get-vase-by-pith:su q.meta /)
      =/  diff
      [(oust [0 2] p.meta) [%comment ~]]
      =/  id  (en-tape:pith:neo p:meta)
      :_  manx/!>((render ~ id))
      :~  [/[p/our.bowl]/storage %poke storage-diff/!>(diff)]
      ==
    =/  render-data  (get-comments deps.bowl)
    [~ manx/!>((render render-data))]
  ::
  ++  poke
    |=  [sud=stud:neo vaz=vase]
    ^-  (quip card:neo pail:neo)
    ?+  sud  ~|(bad-stud/stud !!)
        %ui-event
      =/  eve  !<(ui-event vaz)
      ?>  ?=([%submit %meta %comment ~] path.eve)
      =/  txt=@t  (~(got by data.eve) 'comment')
      =/  create=pith:neo  (oust [0 2] p:(~(got by deps.bowl) %src))
      ::~&  >  create-at-pith/create
      =/  dif  [%comment (sy [now.bowl our.bowl txt] ~)]
      :_  pail
      :~  
        [/[p/our.bowl]/storage %poke storage-diff/!>([create dif])]
      ==
        %rely
      =/  render-data  (get-comments deps.bowl)
      [~ manx/!>((render render-data))]
    ==
  ::
  --
--
::
|%
++  render
  |_  [meta=(set comment) id=tape]
  ++  $
    ^-  manx
    ;div.fc.g1
    =style  "margin-top: 0.5rem;"
      ;+  buttons
      ;div.b2.p2.bd2.br2.hidden
      =id  (welp "wrapper" id)
        ;+  comment-form
        ;+  comments
      ==
    ==
  ++  buttons 
    ;div.fr.je.g1
      ;button.bd1.br3.b2.hover
      =onclick  (welp "this.parentNode.nextSibling.children[0].classList.toggle('hidden'); " hidden-logic)
        ;span
        =style  "padding: 1px;"
        ; +
        ==
      ==
      ;+  
      ?~  meta  
        ;div.hidden;
      ;button.bd1.br3.b2.hover
      =onclick  (welp "this.parentNode.nextSibling.children[1].classList.toggle('hidden'); " hidden-logic)
        ;span: 💬
      ==
    ==
  ::
  ++  comment-form
    ;form.fr.hidden.g1.b2
    =id  (welp "form" id)
    =event  "/submit/meta/comment"
      ;input.p2.grow.b0.bd2.br2
      =type  "text"
      =required  ""
      =name  "comment"
      =placeholder  "comment"
      ;
      ==
      ;button.loader.bd2.br2.p2.b0.hover
      =onclick  (welp "this.parentNode.classList.add('hidden'); " hidden-logic)
      =type  "submit"
        ;span.loaded:  send
        ;span.loading:  loading
      ==
    ==
  ::
  ++  comments
    ;div.hidden.fc.g1.mt1
    =id  (welp "comments" id)
      ;*  
      =/  comments  ~(tap in meta)
      =/  sorted  
        %+  sort  comments
        |=  [a=comment b=comment]
        (gte when.a when.b)
      %+  turn  sorted
      |=  =comment
      ^-  manx
      ;div.fc.wf
        ;div.fr.jb
          ;p.f1.p1: {(scow %p from.comment)}
          ;p.f1: {(pretty-date when.comment)}
        ==
        ;div.hfc.fc.as.p4.wf.bd2.br2.b1
          ;p.grow: {(trip txt.comment)}
        ==
      ==
    ==
  ++  hidden-logic
  =/  id-form  (welp "form" id)
  =/  id-wrapper  (welp "wrapper" id)
  =/  id-comments  (welp "comments" id)
  ;:  weld
    %-  trip
    'if (document.getElementById(\''
    id-comments
    %-  trip
    '\').classList.contains("hidden") & document.getElementById(\''
    id-form
    %-  trip
    '\').classList.contains("hidden")) { document.getElementById(\''
    id-wrapper
    %-  trip
    '\').classList.add("hidden") }else{ document.getElementById(\''
    id-wrapper
    %-  trip
    '\').classList.remove("hidden") };'
  ==
  --
::
++  get-comments
  |=  deps=(map term (pair pith:neo lore:neo))
  ^-  [(set comment) tape]
  =/  meta=(pair pith:neo lore:neo)  (~(got by deps) %src)
  =/  uvase=(unit vase)  ::(get-vase-saga-by-pith:su q.meta /)
    =/  idea=(unit idea:neo)  (~(get of:neo q.meta) /)
    ?~  idea  ~
    `q.q.saga:(need idea)
  =/  here  (en-tape:pith:neo p:(~(got by deps) %src))
  ?~  uvase  `here
    :-  !<((set comment) (need uvase))
        here
::
++  pretty-date  :: from diary-htmx
  |=  date=@da
  ^-  tape
  =/  d  (yore date)
  "{(y-co:co y:d)}-{(y-co:co m:d)}-{(y-co:co d:t:d)}"
--