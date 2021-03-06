configuration Msp432UsciUartA0P {
  provides {
    interface Init;
    interface UartStream;
    interface UartByte;
    interface Msp432UsciError;
  }
  uses {
    interface Msp432UsciConfigure;
    interface HplMsp432Gpio as RXD;
    interface HplMsp432Gpio as TXD;
    interface Panic;
    interface Platform;
  }
}
implementation {

  components     Msp432UsciA0P     as UsciP;
  components new Msp432UsciUartP() as UartP;

  UartP.Usci            -> UsciP;
  UartP.Interrupt       -> UsciP;

  RXD                   =  UartP.RXD;
  TXD                   =  UartP.TXD;

  Panic                 =  UartP;
  Platform              =  UartP;

  Init                  =  UartP;
  Msp432UsciConfigure   =  UartP;

  UartStream            =  UartP;
  UartByte              =  UartP;
  Msp432UsciError       =  UartP;

  components LocalTimeMilliC;
  UartP.LocalTime_bms   -> LocalTimeMilliC;
}
