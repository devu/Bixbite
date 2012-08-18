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

package org.bixbite.framework.signal 
{
	/**
	 * @langversion	3.0
	 */
	public class ContextLoaderSignal 
	{
		/**
		 * IN {name:String, path:String}
		 */
		static public const LOAD				:String 	= "ContextLoaderSignal.LOAD";
		static public const GET					:String 	= "ContextLoaderSignal.GET";
		static public const SET_PRIORITY		:String 	= "ContextLoaderSignal.SET_PRIORITY";
		
		/**
		 * OUT
		 */
		static public const LOADED				:String 	= "ContextLoaderSignal.LOADED";
		static public const SKIPPED				:String 	= "ContextLoaderSignal.SKIPPED";
		static public const ON_PROGRESS			:String 	= "ContextLoaderSignal.ON_PROGRESS";
		static public const QUEUE_COMPLETED		:String 	= "ContextLoaderSignal.QUEUE_COMPLETED";
		
	}

}