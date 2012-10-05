ZERO=:f:v v
ONE=:f:v fv
TWO=:f:v f(fv)

INC=:n:f:v f(nfv)

THREE=INC TWO

ADD=:a:b :f:v af(bfv)

MUL= :a:b a(ADD b) ZERO

(((:f:v v) <inc>) <0>)
(([(:f:v v)  ()] <inc>) <0>)
([(:v v) @ (f:<inc>)] <0>)

:f:v fv
:f:v f(fv)
