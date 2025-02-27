/@  eyre-reqs
/@  tree-diff
/-  serv=sky-server
/-  srv=server
/-  su=shrub-utils
/*  feather
/>  htmx
/<  node
/<  http-request
=<
^-  kook:neo
|%
++  state  pro/%eyre-id
++  poke   (sy %tree-diff %ack %eyre-task ~)
++  kids  *kids:neo
++  deps
  %-  ~(gas by *band:neo)
  :~  :-  %src
      ^-  fief:neo
      :-  req=&
      ^-  quay:neo
      :-  [pro/%root ~]
      ^-  (unit port:neo)
      :+  ~  %z
      %-  ~(gas by *lads:neo)
      :~  :-  &
          `lash:neo`[any/~ ~]
      ==
  ==
++  form
  |_  [=bowl:neo =aeon:neo =pail:neo]
  ++  init
    |=  pal=(unit pail:neo)
    :_  eyre-id/!>(*@ta)
    =/  =pith:neo  #/[p/our.bowl]/$/eyre
    =/  =binding:eyre  [~ ~[%tree]]
    =/  =req:eyre:neo  [%connect binding here.bowl]
    :~  [pith %poke eyre-req/!>(req)]
    ==
  ::
  ++  poke
    |=  [=stud:neo vax=vase]
    ^-  (quip card:neo pail:neo)
    ?+  stud  ~|(bad-stud/stud !!)
        %tree-diff
      :_  eyre-id/q.pail
      =/  diff  !<(tree-diff vax)
      ::~&  >>>  diff-tree-imp/diff
      =,  diff
      ?-  -.diff
        ::
          %send-make
        :~
            [pith %make stud.diff init conf]
        ==
        ::
          %send-poke
        :~
            [pith %poke [stud.diff vase.diff]]
        ==
        ::
          %send-cull
        ~&  >>>  pith-cull/pith
        :~
            [pith %cull ~]
        ==
        ::
          %req-parsing-err
        ~&  >  tang
        ~&  !<(@ta q.pail)
        %:  eyre-cards
        !<(@ta q.pail)
        bowl
        200
        ['content-type'^'text/html']~
        (err-trace-manx tang)
        ==
      ==
      ::
        %ack
      :_  eyre-id/q.pail
      =/  eyre-id  !<(@ta q.pail)
      =+  ^=  resp
          :*
            eyre-id
            bowl
            200
            headers=`header-list:http`['content-type'^'text/html']~
            manx=*manx
          ==
      ?~  !<((unit quit:neo) vax)
        =.  headers.resp
          %+  snoc  headers.resp
          'HX-Refresh'^'true'
        (eyre-cards resp)
      ?:  =(*pail:neo pail)  ~
      =/  =quit:neo  (need !<((unit quit:neo) vax))
      ?+  -.quit  ~
          %goof
        =.  manx.resp  (err-trace-manx +.quit)
        (eyre-cards resp)
      ==
      ::
        %eyre-task
      =+  !<(=task:eyre:neo vax)
      =/  [eyre-id=@ta req=inbound-request:eyre]  task
      =/  request=request:http  request.req
      ?.  authenticated.req
        :_  eyre-id/q.pail
        =/  eyre=pith:neo  #/[p/our.bowl]/$/eyre
        %+  ~(respond neo:srv eyre)   eyre-id
        (login-redirect:gen:srv request)
      =/  purl  (parse-url:serv request)
      =/  inner=pith:neo  (pave:neo (slag 1 pax.purl))
      =/  src  (~(got by deps.bowl) %src)
      =/  here  (tail inner)
      =+  ^=  resp
          :*
            eyre-id
            bowl
            status=200
            headers=`header-list:http`['content-type'^'text/html']~
            manx=*manx
          ==
      ?+    method.request  ~|(%unsupported-http-method !!)
        ::
          %'GET'
        :_  eyre-id/q.pail
        ?.  =((head inner) p/our.bowl)
          =.  status.resp  404
          =.  manx.resp  ;div:  not on your ship
          %-  eyre-cards  resp
        =/  kids=(list pith:neo)  (kids-at-pith:su q.src here)
        =.  manx.resp
          ?~  idea=(~(get of:neo q.src) here)
            (view inner [%$ !>(~)] kids bowl)
          =/  local=pail:neo  q.saga:(need idea)
          (view inner local kids bowl)
        %-  eyre-cards  resp
        ::
          %'POST'
        =/  poke-stud
          ^-  stud:neo
          ~|  %no-stud-specified
          (~(got by pam.purl) 'stud')
        =/  diff-vase  (http-request [poke-stud `request:http`request])
        =/  tree-diff  !<(tree-diff diff-vase)
        ?-  -.tree-diff
        ::
            %send-make
          ::  %make cards don't have error(%goof) %acks yet
          ::  sending eyre response here for now
          :_  eyre-id/!>(eyre-id)
          =/  mule-vax  (mule-vase bowl request)
          =/  mule-conf=(each conf:neo tang)
            %-  mule  |.
            !<  conf:neo
            %+  to-hoon  bowl
            (get-by-name request 'conf')
          ?:  |(?=(%| -.mule-vax) ?=(%| -.mule-conf))
          %+  poke-tree-card  here.bowl
            !>  :-  %req-parsing-err
            ?:  ?=(%| -.mule-vax)
              p.mule-vax
            p.mule-conf
          =/  vax=vase  p.mule-vax
          =/  =conf:neo  p.mule-conf
          =+  diff=tree-diff
          =.  init.diff
            %-  some
            :-  p:(need init.diff)
                vax
          =.  conf.diff  conf
          =.  pith.diff  (get-pith bowl request)
          =.  headers.resp
            %+  snoc  headers.resp
            'HX-Refresh'^'true'
          %+  welp
            (poke-tree-card here.bowl !>(diff))
            %-  eyre-cards  resp
          ::
            %send-poke
          :_  eyre-id/!>(eyre-id)
          =/  mule-vax  (mule-vase bowl request)
          ?-  -.mule-vax
              %|
            (poke-tree-card here.bowl !>([%req-parsing-err p.mule-vax]))
            ::
              %&
            =+  diff=tree-diff
            =.  vase.diff  p.mule-vax
            (poke-tree-card here.bowl !>(diff))
          ==
          ::
            %send-cull
          :_  eyre-id/q.pail
          =/  poke-card=(list card:neo)  (poke-tree-card here.bowl diff-vase)
          =/  location
            %-  crip
              %+  weld  "/tree"
                (en-tape:pith:neo (snip inner))
          =.  headers.resp
            %+  snoc  headers.resp  'HX-Redirect'^location
          %+  welp
            poke-card
          %-  eyre-cards  resp
          ::
            %req-parsing-err  [~ eyre-id/q.pail]
        ==
      ==
    ==
  --
--
::
|%
::
++  manx-to-octs
  |=  man=manx
  (as-octt:mimes:html (en-xml:html man))
::
++  eyre-cards
  |=  [eyre-id=@ta =bowl:neo status=@ud =header-list:http =manx]
  ^-  (list card:neo)
  =/  =pith:neo  #/[p/our.bowl]/$/eyre
  =/  head=sign:eyre:neo  [eyre-id %head [status header-list]]
  =/  data=sign:eyre:neo  [eyre-id %data `(manx-to-octs manx)]
  =/  done=sign:eyre:neo  [eyre-id %done ~]
  :~  [pith %poke eyre-sign/!>(head)]
      [pith %poke eyre-sign/!>(data)]
      [pith %poke eyre-sign/!>(done)]
  ==
::
++  poke-tree-card
  |=  [here=pith:neo vax=vase]
  ^-  (list card:neo)
  :~  [here %poke %tree-diff vax]
  ==
::
++  get-kids
  |=  [=pith:neo =lore:neo]
  =|  i=@
  ^-  (list pith:neo)
  =+  piths=(full-pith pith lore)
  |-
  ?:  =(i (lent piths))  piths
    =/  p=pith:neo  (snag i piths)
    ?~  (~(kid of:neo lore) p)
      $(i +(i))
    =/  grand-kids  (full-pith p lore)
    $(i +(i), piths (welp piths grand-kids))
::
++  full-pith
  |=  [parent=pith:neo =lore:neo]
  ^-  (list pith:neo)
  ?~  (~(kid of:neo lore) parent)  ~
  %+  turn  (kids-at-pith:su lore parent)
    |=  p=pith:neo
    %+  welp  parent  p
::
++  get-pith
  |=  [=bowl:neo req=request:http]
  ^-  pith:neo
  =/  parent=pith:neo
    %-  pave:neo
    %-  stab  (get-by-name req 'here')
  =/  kid  (get-by-name req 'pith')
  ?~  kid  parent
  =/  kid-pith  !<  pith:neo  (to-hoon bowl kid)
  (welp parent kid-pith)
::
++  mule-vase
  |=  [=bowl:neo req=request:http]
  ^-  (each vase tang)
  %-  mule  |.
  %+  to-hoon  bowl
  (get-by-name req 'vase')
::
++  get-by-name
  |=  [req=request:http hoon=cord]
  ^-  cord
  =/  pam  (~(uni by pam:(parse-url:serv req)) (parse-form-body:serv req))
  =/  bod  ~(. by pam)
  ?~  value=(get:bod hoon)  ''
  u:value
::
++  to-hoon
  |=  [=bowl:neo =cord]
  ^-  vase
  %+  slap  :(slop !>(..zuse) !>(bowl) !>(neo))
  %-  ream  cord
::
++  err-trace-manx
|=  =tang
^-  manx
  ;div.p2
    ;*  %+  turn  tang
      |=  =tank
      ^-  manx
      ;div.wf.fr.js.p1.error.mono
        ;  {~(ram re tank)}
      ==
  ==
::
++  empty-manx
  ;div.hidden
  ;
  ==
::
++  view
  |=  [here=pith:neo =pail:neo kids=(list pith:neo) =bowl:neo]
  ;html
    ;head
      ;meta(charset "UTF-8");
      ;title: tree  {(en-tape:pith:neo here)}
      ;script(src "https://unpkg.com/htmx.org@2.0.2");
      ;script(src "https://code.jquery.com/jquery-3.7.1.min.js");
      ;style: {(trip feather)}
      ;link(rel "icon", href "https://em-content.zobj.net/source/google/387/potted-plant_1fab4.png");
    ==
    ;body.top
      ;main.mw-page.p-page.ma.fc.g6
        ;*  ?:  &(=(kids ~) =(pail [%$ !>(~)]))
          (nothing-view here)
        ;=
          ;+  (shrub-view here pail bowl)
          ;+  (kids-view here pail kids)
        ==
      ==
    ==
  ==
::
++  nothing-view
  |=  here=pith:neo
  =/  parent  (en-tape:pith:neo (snip here))
  ^-  marl
  ;=
    ;div.wf.fc.p2.ac.g2.bd1.br2
      ;div.top.fr.jb.g2.wf
        ;h1.p2:  nothing at {(en-tape:pith:neo here)}
        ;div.buttons.fr.g2
          ;a.loader.p2.tc.hover.b0.bd1.br2.grow
          =href  "/tree{parent}"
            ;span.loaded.hf: back to {parent}
            ;span.loading.hf:  loading
          ==
          ;button.make.p2.br1.hover.b1
            =onclick
              """
              $(this).siblings().removeClass('toggled');
              $(this).addClass('toggled');
              $(this).closest('body').find('.tab').addClass('hidden');
              $(this).closest('body').find('.tab.make-form').removeClass('hidden');
              $(this).closest('body').find('.error-box').html('');
              """
            ;span:  make
          ==
        ==
      ==
      ;div.fr.jb.g2.wf
        ;div.forms.fc.as.g2.wf
          ;div.error-box
          ;
          ==
          ;+  (make-form here |)
        ==
      ==
    ==
  ==
::
++  shrub-view
  |=  [here=pith:neo =pail:neo =bowl:neo]
  ^-  manx
  ;div
    ;div.fc.g2
      ;div.top.frw.ac.g2.p3
        ;h1.grow:  {(en-tape:pith:neo here)}
        ;+  buttons
      ==
      ;div.tabs
        ;*  (forms here)
        ;+  (state-print pail bowl)
      ==
    ==
  ==
++  kids-view
  |=  [here=pith:neo =pail:neo kids=(list pith:neo)]
  ^-  manx
  ;div.fc.g1
    ;*
    %+  turn
        %+  sort  kids
        aor
    |=  =pith:neo
    ^-  manx
    ?~  pith
      empty-manx
    ;a.fr.jb.g1.br1.hover.b1
      =href  "/tree{(en-tape:pith:neo (weld here pith))}"
      ;div.p2.hfc.p2.hover
        ;  {(en-tape:pith:neo pith)}
      ==
    ==
  ==
::
++  state-print
  |=  [=pail:neo =bowl:neo]
  ^-  manx
  ;div.br1.bd1.p2.tab.view-tab.fc.g2
    =style  "--line-height: 1.1;"
    ;a.loader.p-1.s-1.br1.hover.b1.wfc
      =href  "/tree/{(scow %p our.bowl)}/cod/std/src/pro/{(trip ?@(p.pail p.pail mark.p.pail))}"
      ;span.loaded: {<p.pail>}
      ;span.loading:  loading
    ==
    ;div.pre-wrap.break.mono.p2.scroll-y
      =style  "max-height: 400px;"
      ;+
      ;/
      ?:  =(p.pail %hoon)
        (trip !<(@t q.pail))
      =/  size  (met 3 (jam q.q.pail))
      ?:  (gth size 750)  "vase too large to print: {<size>}"
      (of-wall:format (~(win re (sell q.pail)) 0 55))
    ==
  ==
::
++  pro-files
  |=  [=pail:neo here=pith:neo =bowl:neo]
  ^-  manx
  ?.  =(p.pail %hoon)
    empty-manx
  =/  =name:neo  [our.bowl here]
  =/  fool=(each file:ford:neo tang)
    %-  mule
    |.
    (scan (trip !<(@t q.pail)) (rein:ford:neo name))
  ?:  ?=(%| -.fool)
    empty-manx
  ;div.fr.g2.import-btn
    ;*  %+  turn  pro.p.fool
    |=  =pro:ford:neo
    ^-  manx
    ;a.loader.bd1.br2.p2.hover.b0
      =href  "/tree/{(scow %p our.bowl)}/cod/std/src/pro/{(trip ?@(stud.pro stud.pro mark.stud.pro))}"
        ;span.loaded.hfc: {<stud.pro>}
        ;span.loading.hfc:  loading
    ==
  ==
++  buttons
  ^-  manx
  ;div.buttons.fr.g2
    ;button.make.p2.br1.hover.b1.toggled
      =onclick
        """
        $(this).siblings().removeClass('toggled');
        $(this).addClass('toggled');
        $(this).closest('body').find('.tab').addClass('hidden');
        $(this).closest('body').find('.tab.view-tab').removeClass('hidden');
        $(this).closest('body').find('.error-box').html('');
        """
      ;span:  view
    ==
    ;button.make.p2.br1.hover.b1
      =onclick
        """
        $(this).siblings().removeClass('toggled');
        $(this).addClass('toggled');
        $(this).closest('body').find('.tab').addClass('hidden');
        $(this).closest('body').find('.tab.make-form').removeClass('hidden');
        $(this).closest('body').find('.error-box').html('');
        """
      ;span:  make
    ==
    ;button.poke.p2.br1.hover.b1
      =onclick
        """
        $(this).siblings().removeClass('toggled');
        $(this).addClass('toggled');
        $(this).closest('body').find('.tab').addClass('hidden');
        $(this).closest('body').find('.tab.poke-form').removeClass('hidden');
        $(this).closest('body').find('.error-box').html('');
        """
      ;span:  poke
    ==
    ;button.cull.p2.br1.hover.b1
      =onclick
        """
        $(this).siblings().removeClass('toggled');
        $(this).addClass('toggled');
        $(this).closest('body').find('.tab').addClass('hidden');
        $(this).closest('body').find('.tab.cull-form').removeClass('hidden');
        $(this).closest('body').find('.error-box').html('');
        """
      ;span:  cull
    ==
  ==
::
++  forms
  |=  here=pith:neo
  ^-  marl
  ;=
    ;div.error-box;
    ;+  (make-form here &)
    ;+  (poke-form here)
    ;+  (cull-form here)
  ==
::
++  make-form
  |=  [here=pith:neo main=?]
  ^-  manx
  ;form.tab.make-form.hidden.bd1.br2.fc.g2.p2.wf.hfc
    =hx-post    "/tree{(en-tape:pith:neo here)}?stud=tree-diff&head=send-make"
    =hx-swap    "outterHTML"
    =hx-target  ".error-box"
    ;div.frw.g2
      ;input.hidden
      =type   "text"
      =name   "here"
      =value  (en-tape:pith:neo here)
      ;
      ==
      ;+
      =;  m
      ?.  main  -
      m(a.g [[%required ""] a.g.m])
      ^-  manx
      ;input.bd1.br2.p2.grow
      =type          "text"
      =name          "pith"
      =oninput       "this.setAttribute('value', this.value);"
      =placeholder   "/some/pith"
      ;
      ==
      ;input.bd1.br2.p2.grow
      =type          "text"
      =name          "stud"
      =oninput       "this.setAttribute('value', this.value);"
      =placeholder   "%shrub-type"
      =required      ""
      ;
      ==
      ;input.bd1.br2.p2.grow
      =type          "text"
      =name          "head-pail"
      =oninput       "this.setAttribute('value', this.value);"
      =placeholder   "%state-type"
      =required      ""
      ;
      ==
    ==
    ;div.frw.g2
      ;input.bd1.br2.p2.grow
      =type          "text"
      =name          "vase"
      =oninput       "this.setAttribute('value', this.value);"
      =placeholder   "state value"
      =required      ""
      ;
      ==
      ;input.bd1.br2.p2.grow
      =type          "text"
      =name          "conf"
      =oninput       "this.setAttribute('value', this.value);"
      =placeholder   "(map term pith:neo)"
      =required      ""
      ;
      ==
      ;div.form-btn
        ;button.loader.bd1.br2.hover.b0.p2
          ;span.loaded.p2:  make
          ;span.loading.p2:  loading
        ==
      ==
    ==
  ==
::
++  poke-form
  |=  here=pith:neo
  ^-  manx
  ;form.tab.poke-form.hidden.bd1.br2.frw.jb.g2.p2.wf
    =hx-post    "/tree{(en-tape:pith:neo here)}?stud=tree-diff&head=send-poke"
    =hx-swap    "outterHTML"
    =hx-target  ".error-box"
    ;input.hidden
    =type   "text"
    =name   "pith"
    =value  (en-tape:pith:neo here)
    ;
    ==
    ;input.p2.bd1.br2.basis-full
    =type          "text"
    =name          "stud"
    =oninput       "this.setAttribute('value', this.value);"
    =autocomplete  "off"
    =placeholder   "%diff-type"
    =required      ""
    ;
    ==
    ;input.p2.bd1.br2.grow
    =type          "text"
    =name          "vase"
    =oninput       "this.setAttribute('value', this.value);"
    =autocomplete  "off"
    =placeholder   "diff value"
    =required      ""
    ;
    ==
    ;div.form-btn
      ;button.loader.bd1.br2.hover.b0.p2
        ;span.loaded.p2:  poke
        ;span.loading.p2:  loading
      ==
    ==
  ==
::
++  cull-form
  |=  here=pith:neo
  =/  warning  "Are you sure you want to delete this shrub and all their kids?"
  ^-  manx
  ;form.tab.cull-form.hidden.bd1.br2.p2.wf
  =style    "border: 2px solid #FF0000; border-radius: 6px;"
  =hx-post  "/tree{(en-tape:pith:neo here)}?stud=tree-diff&head=send-cull"
    ;div.fc.ac
      ;p:  {warning}
    ==
    ;div.fr.jc.g8.p2.cull-btn
      ;button.cull-trigger.hfc.p2.red-hover
      =name     "pith"
      =value    (en-tape:pith:neo here)
        ;span.p2:  yes
      ==
      ;span.hfc.p2.red-hover.pointer
      =onclick
      """
      $(this).parent().parent().addClass('hidden');
      $(this).parent().parent().parent().parent().find('.top').find('.buttons').find('.cull').toggleClass('toggled');
      """
        ;span.p2:  no
      ==
    ==
  ==
--
