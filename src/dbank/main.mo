import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";

actor DBank{
  stable var currentValue = 300; //stable retains value even after dfx deploy
  //currentValue := 100; // use := to change value

  let id = 123456789; // let is constant

  Debug.print("Hello");
  Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //topUp();

  public func withdrawal (amount:Nat){
    let tempValue: Int = currentValue - amount;
    if(tempValue >= 0 ){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large,  currentValue less than zero")
    }
  };  

  public query func checkBalance(): async Nat {
    return currentValue
  };

  
}