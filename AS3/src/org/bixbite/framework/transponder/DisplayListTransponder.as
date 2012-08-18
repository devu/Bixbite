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

package org.bixbite.framework.transponder 
{
	import org.bixbite.core.Signal;
	import org.bixbite.core.Transponder;
	import org.bixbite.framework.signal.DisplaySignal;
	
	/**
	 * @langversion	3.0
	 */
	public class DisplayListTransponder extends Transponder 
	{
		public function DisplayListTransponder() 
		{
			
		}
		
		override public function init():void 
		{
			addSlot(DisplaySignal.SET_CONTEXT, onSetContext);
			addSlot(DisplaySignal.ADD_CONTEXT, onAddContext);
			addSlot(DisplaySignal.REMOVE_CONTEXT, onRemoveContext);
		}
		
		private function onSetContext(s:Signal):void
		{
			s.params.viewUID = s.callerUID;
			sendSignal(DisplaySignal.SET_CONTEXT, s.params);
		}
		
		private function onAddContext(s:Signal):void 
		{
			s.params.viewUID = s.callerUID;
			sendSignal(DisplaySignal.ADD_CONTEXT, s.params);
		}
		
		private function onRemoveContext(s:Signal):void 
		{
			s.params.viewUID = s.callerUID;
			sendSignal(DisplaySignal.REMOVE_CONTEXT, s.params);
		}
		
		override public function destroy():void 
		{
			removeSlot(DisplaySignal.SET_CONTEXT);
			removeSlot(DisplaySignal.ADD_CONTEXT);
			removeSlot(DisplaySignal.REMOVE_CONTEXT);
			
			super.destroy();
		}
		
	}

}