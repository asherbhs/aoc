Split=.{{(#~x~:{.@>)y</.~(-.*1++/\)x=y}}

input=.|:>>(10#.'0123456789'i.])L:0 ' ' Split&.> LF Split 1!:1<'example.txt'

echo +/|-//:~"1 input       NB. part 1
echo +/([*[:+/=/~)/input    NB. part 2 (cba to do fast version)
