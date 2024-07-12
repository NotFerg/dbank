import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"; 

actor DBank{
  stable var currentValue: Float = 300; //stable retains value even after dfx deploy
  //currentValue := 300; // use := to change value

  let id = 123456789; // let is constant

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  Debug.print("Hello");
  Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //topUp();

  public func withdrawal (amount: Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0 ){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large,  currentValue less than zero")
    }
  };  

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }

  
}