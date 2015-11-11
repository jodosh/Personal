//*!!Sensor,    S1,          touchSensor, sensorTouch,      ,                    !!*//
//*!!                                                                            !!*//
//*!!Start automatically generated configuration code.                           !!*//
const tSensors touchSensor          = (tSensors) S1;   //sensorTouch        //*!!!!*//
//*!!CLICK to edit 'wizard' created sensor & motor configuration.                !!*//

//******************************************************************************//
//                              Wait for Push                                   //
//                              ROBOTC on NXT                                   //
//                                                                              //
//  This program allows your taskbot to run straight while the touch sensor is  //
//  released.  Once, the touch sensor is pushed, the robot will reverse and     //
//  stop.                                                                       //
//                                                                              //
//******************************************************************************//
//				Focus                                           //
//                                                                              //
//  In this program, the focus is learning how to use a while look when checking a sensor condition.  //
//  This program will cause the robot to contiously move forward while the touch sensor  //
// is not pressed in. As soon as the touch sensor is pressed, the program will 'break' out of the while loop //
// and move on to the rest of the code. In this program, the rest of the code will cause the robot to //
// move in reverse for one second and then stop the robot. The focus of all of this is learning how to  //
// perform different actions when conditional statements are being used. //
//                                                                              //
//******************************************************************************//
//				Notes                                           //
//				                                                //
//  1. The touch sensor should be mounted on the front.                         //
//                                                                              //
//******************************************************************************//
//				Motors & Sensors                                //
//                                                                              //
//  [I/O Port]     [Name]          [Type]               [Description]           //
//  Port 1         touchsensor     Touch                Front mounted           //
//  Port C         none            Motor                Right Motor             //
//  Port B         none            Motor                Left Motor              //
//                                                                              //
//******************************************************************************//


task main()
{
   while(SensorValue(touchSensor) == 0)   //a while loop is declared with the touchsensor's value being 0 as it true condition
   {
      motor[motorC] = 100;                //Motor C is run at a 100 power level
      motor[motorB] = 100;                //motor B is run at a 100 power level
   }

   motor[motorC] = -75;                   //Motor C is run at a -75 power level
   motor[motorB] = -75;                   //motor B is run at a -75 power level

   wait1Msec(1000);                       //the program waits 1000 milliseconds before running further code
}
