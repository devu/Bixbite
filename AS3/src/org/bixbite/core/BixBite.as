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

package org.bixbite.core 
{
	import flash.display.Stage;
	import flash.utils.describeType;
	import org.bixbite.namespaces.BIXBITE;
	import org.bixbite.utils.ClassUtil;
	
	/**
	 * @langversion	3.0
	 * @version 0.6.1
	 */
	public class BixBite
	{
		use namespace BIXBITE;
		
		public static var instance	:BixBite;
		
		BIXBITE var emiter		:Emiter;
		
		BIXBITE var uid			:String;
		
		BIXBITE var slotsT		:Object;
		
		public var signal		:Signal;
		
		public function BixBite(stage:Stage) 
		{
			instance = this;
			
			emiter = Emiter.startup(stage);
			
			slotsT = emiter.slots.t;
			uid = "@" + emiter.uid;
			signal = new Signal(uid);
			super();
		}
		
		public function register(compound:Class):void
		{
			emiter.registerComponent(compound);
		}
		
		public function unregister(component:Class):void
		{
			emiter.unregisterComponent(component);
		}
		
		public function sendSignal(type:String, params:Object = null):void
		{
			signal.params = params;
			emiter.broadcast(slotsT, type, signal);
		}
		
		public function track():void 
		{
			emiter.checkComponents();
		}
	}

}