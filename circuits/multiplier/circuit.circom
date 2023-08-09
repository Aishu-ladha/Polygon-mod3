pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  

  // signal inputs
  signal input a;
  signal input b;

  // signals from gates
  signal  x;
  signal y;

  // final signal output
  signal output Q;

  // component gates used to create custom circuit
  component andGate=AND();
  component notGate=NOT();
  component orGate = OR();

  //circuit logic
  andGate.a<== a;
  andGate.b<==b;
  x<== andGate.out;


notGate.in<==b;
y<==notGate.out;


  orGate.a <== x;
  orGate.b <== y;
  Q <== orGate.out;

   // print the value of Q on input of a=0 & b=1;
   log("Q : ", Q);
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}


component main = Multiplier2();