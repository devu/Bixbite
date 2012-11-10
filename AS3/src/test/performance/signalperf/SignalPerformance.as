/**The MIT License

@copy (c) 2012 Devu Design Limited, Daniel Wasilewski

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package test.performance.signalperf 
{
	import org.bixbite.core.Compound;
	import test.performance.signalperf.behaviour.TestBehaviour;
	import test.performance.signalperf.behaviour.TestRunnerSRS;
	import test.performance.signalperf.behaviour.TestRunnerStandard;
	import test.performance.signalperf.transponder.TestTransponder;
	import test.performance.signalperf.view.TestView;
	
	/**
	 * @langversion	3.0
	 * footprint 10.0kb
	 * 
	 * Subject of this test is to check performance of the current BixBite signal flow implementation.
	 * 
	 * 1 Phase
	 * On mouse click Transponder will send signal to Atom and Atom will respond to View.
	 * This is just initial flow test. Making sure Components can talk to each other.
	 * 
	 * 2 Phase
	 * Once 1 Phase is finished View will send X number of times signals going through full triade following the flow:
	 * View -> Transponder -> Atom -> View. When finish will send signal to Stats to display results.
	 * 
	 * Signals traveling from View -> Transponder -> Atom -> View. (CDTV);
	 * 
	 * Results 
	 * (FP 11,5,31,101 - Chrome)		(FP 11,4,402,287 - FF)
	 * 
	 * (strongly typed SRS implementation)
	 * v0.6.7 SRS	PC				
	 * 1.000 		- <0ms				- <0ms					(3k signals in circulation)
	 * 10.000 		- 1ms				- 1ms 					(30k signals in circulation)
	 * 100.000		- 12ms				- 11ms					(300k signals in circulation)
	 * 1.000.000	- 125ms				- 111ms					(3M signals in circulation) 	
	 * 10.000.000	- 1260ms			- 1100ms				(30M signals in circulation)
	 * 
	 * v0.6.7(linked list implementation)
	 * 1.000 		- 1ms				- <0ms					(3k signals in circulation)
	 * 10.000 		- 11ms				- 10ms					(30k signals in circulation)
	 * 100.000		- 110ms				- 105ms					(300k signals in circulation)
	 * 1.000.000	- 1109ms			- 1092ms				(3M signals in circulation)
	 * 10.000.000	- 11253ms			- 10339ms				(30M signals in circulation)
	 * 
	 * (Yes flash player slowing down from version to version, but we trying hard to speed up BixBite anyway :) )
	 * 
	 * Results (Flash Player 11,1,102,63 - Chrome)
	 * 
	 * v0.6.1 SRS	PC				Laptop
	 * 1.000 		- <0ms			-//-	(3k signals in circulation)
	 * 10.000 		- 1ms			?		(30k signals in circulation)
	 * 100.000		- 9ms			?		(300k signals in circulation)
	 * 1.000.000	- 88ms			?		(3M signals in circulation) 	
	 * 10.000.000	- 889ms			?		(30M signals in circulation)
	 * 
	 * v0.5.4 SRS
	 * 1.000 		- <0ms					(3k signals in circulation)
	 * 10.000 		- 0.9ms					(30k signals in circulation)
	 * 100.000		- 9ms					(300k signals in circulation)
	 * 1.000.000	- 93ms					(3M signals in circulation)
	 * 10.000.000	- 910ms					(30M signals in circulation)
	 * 
	 * v0.5.2 SRS
	 * 1.000 		- no time:)	(3k signals in circulation)
	 * 10.000 		- 0.9ms		(30k signals in circulation)
	 * 100.000		- 9ms		(300k signals in circulation)
	 * 1.000.000	- 94ms		(3M signals in circulation)
	 * 10.000.000	- 947ms		(30M signals in circulation)
	 * 
	 * v0.5.2
	 * 1.000 		- 1			(3k signals in circulation)
	 * 10.000 		- 12ms		(30k signals in circulation)
	 * 100.000		- 125ms		(300k signals in circulation)
	 * 1.000.000	- 1289ms	(3M signals in circulation)
	 * 
	 * Signals traveling from View -> Transponder -> Model -> View. (MVC)
	 * v0.4.4 SRS in use!
	 * 1.000 		- no time:)	(3k signals in circulation)
	 * 10.000 		- 1ms		(30k signals in circulation)
	 * 100.000		- 9ms		(300k signals in circulation)
	 * 1.000.000	- 99ms		(3M signals in circulation)
	 * 10.000.000	- 931ms		(30M signals in circulation)
	 *
	 * v0.4.4 - No changes
	 * 
	 * v0.4.3
	 * 1.000 		- 1ms		(3k signals in circulation)
	 * 10.000 		- 13ms		(30k signals in circulation)
	 * 100.000		- 133ms		(300k signals in circulation)
	 * 1.000.000	- 1325ms	(3M signals in circulation)
	 * 
	 * v0.4.2
	 * 1.000 		- 2ms		(3k signals in circulation)
	 * 10.000 		- 22ms		(30k signals in circulation)
	 * 100.000		- 207ms		(300k signals in circulation)
	 * 1.000.000	- 2120ms	(3M signals in circulation)
	 * 
	 */
	public class SignalPerformance extends Compound
	{
		public static const INIT_TEST			:String = "SignalPerformance.INIT_TEST";
		public static const START_TEST			:String = "SignalPerformance.START_TEST";
		public static const BEGIN_TEST			:String = "SignalPerformance.BEGIN_TEST";
		public static const RUN_TEST_SRS		:String = "SignalPerformance.RUN_TEST_SRS";
		static public const RUN_TEST_STANDARD	:String = "SignalPerformance.RUN_TEST_STANDARD";
		
		public function SignalPerformance() 
		{
			
		}
		
		override public function init():void
		{
			register(TestTransponder);
			register(TestView);
			
			addBehaviour(SignalPerformance.START_TEST			, TestBehaviour);
			addBehaviour(SignalPerformance.RUN_TEST_SRS			, TestRunnerSRS);
			addBehaviour(SignalPerformance.RUN_TEST_STANDARD	, TestRunnerStandard);
			
			sendSignal(SignalPerformance.INIT_TEST);
		}
		
	}

}