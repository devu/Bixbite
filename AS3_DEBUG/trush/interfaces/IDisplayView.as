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

package org.bixbite.framework.interfaces 
{
	import flash.display.DisplayObject;
	import org.bixbite.core.interfaces.IView;
	import org.bixbite.framework.view.DisplayViewContainer;
	import org.bixbite.framework.view.StageView;
	
	/**
	 * @langversion	3.0
	 * @version 0.5.4
	 */
	public interface IDisplayView extends IView
	{
		/**
		 * Parent view of this view
		 */
		function get parentView():DisplayViewContainer;
		function set parentView(value:DisplayViewContainer):void;
		
		/**
		 * 
		 */
		function get stageView():StageView;
		function set stageView(value:StageView):void;
		
		/**
		 * Reference to native Flash DisplayObject attached to any IDisplayView. Acts as dependency injector.
		 */
		function get context():DisplayObject;
		function setContext(name:String, object:DisplayObject):void
	}
	
}