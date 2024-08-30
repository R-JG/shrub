/@  manx
/@  pith
/@  ui-event
^-  kook:neo
|%
++  state
  ^-  curb:neo
  pro/%pith
++  poke
  ^-  (set stud:neo)
  (sy %pith ~)
++  kids
  ^-  kids:neo
  :+  ~  %y
  %-  ~(gas by *lads:neo)
  :~  :-  [|/%t &/%widget |/%t |]
      [pro/%manx (sy %rely %ui-event ~)]
  ==
++  deps
  %-  ~(gas by *deps:neo)
  :~  :-  %profiles
      :+  req=&  [pro/%sig (sy %sig ~)]
      :+  ~  %z
      %-  ~(gas by *lads:neo)
      :~  :-  [|/%tas &/%profile-image |]
          [or/~[pro/%jpg pro/%png] (sy %sig ~)]
          :-  [|/%tas &/%header-image |]
          [or/~[pro/%jpg pro/%png] (sy %sig ~)]
          :-  [|/%tas &/%sigil-color |]
          [pro/%hexadecimal (sy %sig ~)]
          :-  [|/%tas &/%sigil-background-color |]
          [pro/%hexadecimal (sy %sig ~)]
          :-  [|/%tas &/%display-name |]
          [pro/%txt (sy %sig ~)]
          :-  [|/%tas &/%organization |/%t |]
          [pro/%pith (sy %sig ~)]
          :-  [|/%tas &/%phone-number |]
          [pro/%phone-number (sy %sig ~)]
          :-  [|/%tas &/%email |]
          [pro/%email (sy %sig ~)]
          :-  [|/%tas &/%url |]
          [pro/%url (sy %sig ~)]
          :-  [|/%tas &/%birthday |]
          [pro/%time (sy %sig ~)]
          :-  [|/%tas &/%username |/%t |]
          [pro/%txt (sy %sig ~)]
          :-  [|/%tas &/%about |/%t |]
          [pro/%txt (sy %sig ~)]
          :-  [|/%tas |/%tas &]
          [[%any ~] (sy %sig ~)]
      ==
  ==
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =stud:neo state-vase=vase]
    +*  state  !<(pith state-vase)
    ++  init
      |=  old=(unit pail:neo)
      ^-  (quip card:neo pail:neo)
      ?~  old
        ~_  leaf/"No initial state provided for {<(pout here.bowl)>}"
        !!
      ?>  =(%pith p.u.old)
      ?:  =(~ !<(pith q.u.old))
        ~_  leaf/"No initial profile provided for {<(pout here.bowl)>}"
        !!
      [~ [%pith q.u.old]]
    ++  poke
      |=  [=stud:neo vaz=vase]
      ^-  (quip card:neo pail:neo)
      ?>  =(our.bowl ship.src.bowl)
      ?>  =(stud %pith)
      [~ [%pith vaz]]
  --
--
