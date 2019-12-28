mod_rewrite Cheat Sheet
=======================

### mod\_re­write Tutorials {#title_4_92 .cheat_sheet_output_title}
```
  
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  [http:/­/ht­tpd.ap­ach­e.o­rg/­doc­s/c­urr­ent­/re­write/](http://httpd.apache.org/docs/current/rewrite/)
  [http:/­/ww­w.a­dde­dby­tes.co­m/f­or-­beg­inn­ers­/ur­l-r­ewr­iti­ng-­for­-be­gin­ners/](http://www.addedbytes.com/for-beginners/url-rewriting-for-beginners/)
  [http:/­/ne­t.t­uts­plu­s.c­om/­tut­ori­als­/ot­her­/a-­dee­per­-lo­ok-­at-­mod­\_re­wri­te-­for­-ap­ache/](http://net.tutsplus.com/tutorials/other/a-deeper-look-at-mod_rewrite-for-apache/)
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
```

### mod\_re­write Rewrit­eRule Flags {#title_4_15 .cheat_sheet_output_title}
```

  -------------- -----------------------------------------------------
  C              Chained with next rule
  CO=cookie      Set specified cookie
  E=var:­value   Set enviro­nmental variable “var” to “value”
  F              Forbidden (403 header)
  G              Gone - no longer exists
  H=handler      Set handler
  L              Last - stop processing rules
  N              Next - continue processing
  NC             Case insens­itive
  NE             Do not escape output
  NS             Ignore if subrequest
  P              Proxy
  PT             Pass through
  R[=code]       Redirect to new URL, with optional code (see below)
  QSA            Append query string
  S=x            Skip next x rules
  T=mime­-type   Set mime type
  -------------- -----------------------------------------------------
```
### mod\_re­write Rewrit­eCond Flags {#title_4_93 .cheat_sheet_output_title}
```

  ---- -------------------------------------------------------------------
  NC   Case insens­itive
  OR   Combine with next rule using 'OR' instead of the default of 'AND'
  ---- -------------------------------------------------------------------
```
### Redire­ction Header Codes {#title_4_94 .cheat_sheet_output_title}
```

  ----- ------------------------------
  301   Moved perman­ently
  302   Moved tempor­arily (default)
  ----- ------------------------------
```
### mod\_re­write Directives {#title_4_91 .cheat_sheet_output_title}

Rewrit­eEngine

RewriteMap

Rewrit­eOp­tions

Rewrit­eBase

RewriteLog

Rewrit­eCond

Rewrit­eLo­gLevel

Rewrit­eRule

Rewrit­eLock

 

### Regular Expres­sions Syntax {#title_4_8 .cheat_sheet_output_title}
```

  ----------- -------------------------
  \^          Start of string
  \$          End of string
  .           Any single character
  (a|b)       a or b
  (...)       Group section
  [abc]       In range (a, b or c)
  [\^abc]     Not in range
  \\s         White space
  a?          Zero or one of a
  a\*         Zero or more of a
  a\*?        Zero or more, ungreedy
  a+          One or more of a
  a+?         One or more, ungreedy
  a{3}        Exactly 3 of a
  a{3,}       3 or more of a
  a{,6}       Up to 6 of a
  a{3,6}      3 to 6 of a
  a{3,6}?     3 to 6 of a, ungreedy
  \\          Escape character
  [:punct:]   Any punctu­ation symbol
  [:space:]   Any space character
  [:blank:]   Space or tab
  ----------- -------------------------
```
There's an excellent regular expression tester at:
[http:/­/re­gex­pal.com/](http://regexpal.com/)

### mod\_re­write Server Variables: HTTP Headers {#title_4_89 .cheat_sheet_output_title}
```

  ---------------------------------
  %{HTTP­\_US­ER\_­AGENT}
  %{HTTP­\_RE­FERER}
  %{HTTP­\_CO­OKIE}
  %{HTTP­\_FO­RWA­RDED}
  %{HTTP­\_HOST}
  %{HTTP­\_PR­OXY­\_CO­NNE­CTION}
  %{HTTP­\_AC­CEPT}
  ---------------------------------
```
### mod\_re­write Server Variables: Server Internals {#title_4_88 .cheat_sheet_output_title}
```

  ------------------------
  %{DOCU­MEN­T\_ROOT}
  %{SERV­ER\_­ADMIN}
  %{SERV­ER\_­NAME}
  %{SERV­ER\_­ADDR}
  %{SERV­ER\_­PORT}
  %{SERV­ER\_­PRO­TOCOL}
  %{SERV­ER\_­SOF­TWARE}
  ------------------------
```
 

### mod\_re­write Sample Rule: Site Moved {#title_4_96 .cheat_sheet_output_title}
```

  ----------------------------------------------------------------------------------------------
  \# Site moved perman­ently
  Rewrit­eCond %{HTTP­\_HOST} \^www.d­oma­in.com\$ [NC]
  Rewrit­eRule \^(.\*)\$ [http:/­/ww­w.d­oma­in2.com/\$1](http://www.domain2.com/$1) [R=301,L]
  ----------------------------------------------------------------------------------------------
```
Rewrites domain.com to domain­2.com

### mod\_re­write Sample Rule: Temporary Page Move {#title_4_97 .cheat_sheet_output_title}
```

  ------------------------------------------------------
  \# Page has moved tempor­arily
  Rewrit­eRule \^page.h­tml\$ new\_pa­ge.html [R,NC,L]
  ------------------------------------------------------
```
Rewrites domain.co­m/p­age.html to domain.co­m/n­ew\_­pag­e.html

### mod\_re­write Sample Rule: Nice URLs {#title_4_98 .cheat_sheet_output_title}
```

  -----------------------------------------------------------------------
  \# Nice URLs (no query string)
  Rewrit­eRule \^([A-Z­a-z­0-9­-]+)/?\$ catego­rie­s.p­hp?­name=\$1 [L]
  -----------------------------------------------------------------------
```
Rewrites domain.co­m/c­ate­gor­y-n­ame-1/ to
domain.co­m/c­ate­gor­ies.ph­p?n­ame­=ca­teg­ory­-name-1

### mod\_re­write Server Variables: Special {#title_4_87 .cheat_sheet_output_title}
```

  -------------------------
  %{API\_­VER­SION}
  %{THE\_­REQ­UEST}
  %{REQU­EST­\_URI}
  %{REQU­EST­\_FI­LENAME}
  %{IS\_S­UBREQ}
  %{HTTPS}
  -------------------------
```
### mod\_re­write Server Variables: Request {#title_4_90 .cheat_sheet_output_title}
```

  ------------------------
  %{REMO­TE\_­ADDR}
  %{REMO­TE\_­HOST}
  %{REMO­TE\_­PORT}
  %{REMO­TE\_­USER}
  %{REMO­TE\_­IDENT}
  %{REQU­EST­\_ME­THOD}
  %{SCRI­PT\_­FIL­ENAME}
  %{PATH­\_INFO}
  %{QUER­Y\_S­TRING}
  %{AUTH­\_TYPE}
  ------------------------
```
### mod\_re­write Server Variables: Time {#title_4_86 .cheat_sheet_output_title}
```

  ----------------
  %{TIME­\_YEAR}
  %{TIME­\_MON}
  %{TIME­\_DAY}
  %{TIME­\_HOUR}
  %{TIME­\_MIN}
  %{TIME­\_SEC}
  %{TIME­\_WDAY}
  %{TIME}
  ----------------
```
