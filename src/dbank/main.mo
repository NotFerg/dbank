import Debug "mo:base/Debug";

actor DBank{
  var currentValue = 300;
  currentValue := 100; // use := to change value

  let id = 123456789; // let is constant

  Debug.print("Hello");
  Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl (amount:Nat){
    if(amount > currentValue){
      Debug.print("Insufficient Balance");
    }else{
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }
  };  

  //topUp();
}