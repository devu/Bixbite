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
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import org.bixbite.core.interfaces.ICompound;
	import org.bixbite.core.interfaces.ISignal;
	import org.bixbite.framework.view.RootView;
	import org.bixbite.namespaces.BIXBITE;
	
	/**
     * <p>The Compound represents default class you should subclass your Document Class with.</br>
     * This is required to initialise Emiter and signal/slot system.</p>
     *
     * <p>Due to AS3 Document Class restrictions it must subclass DisplayObjectContainer this is why extends Sprite.</br>
     * The only thing we need from it, is to access the system features. And implementation of this class may vary depends of target platforms.
     * This is platform specific implementation when the Stage is the main system IO provider.</p>
     *
     * <p>In case you have more than one Compound running at the same time any following Compound will run as module, using the same reference of Emiter singleton to make shared signal/slot communication possible.
     * This is very useful in modular projects. Consider application, for instance Preloader, that will load external swf build within BixBite framework as well.
     * Preloader may have already some Components initialised you wish to reuse, so you don't have to repeat yourself.</p>
     * 
	 * @langversion	3.0
	 * @version 0.5.4
	 */
	public class Compound extends Sprite implements ICompound
	{
		use namespace BIXBITE
		
		private var emiter		:Emiter;
		private var slots		:Object// 	= emiter.slots;
		private var _uid		:String//		= "@" + emiter.uid;
		private var _module		:Boolean 	= false;
		private var signal		:ISignal// 	= new Signal(_uid);
		private var behaviours	:Object// = { };
		
		public function Compound()
		{
			if (Object(this).constructor == Compound) throw new IllegalOperationError("Abstract Class");
			Emiter.register(Compound(this));
		}
		
		BIXBITE function initialise(emiter:Emiter, module:Boolean = false):void
		{
			/*
			CONFIG::debug {
				if (module) trace(this, "initialise as module");
				else trace(this, "initialise");
			}*/
			
			this.mouseEnabled = false;
			
			this.emiter = emiter;
			_module 	= module;
			this.slots 	= emiter.slots
			_uid 		= "@" + emiter.uid;
			
			signal = new Signal(_uid);
			behaviours = { };
			
			init();
			
		}
		
		/**
		 *  Abstract method
		 */
		public function init():void
		{
			
		}
		
		/**
		 * Add Behaviour into your Atom. 
		 * Atom implementation does't exist. It's only contractual and virtual name convention. It has been build into Compound for performance reason.
		 * @param	type
		 * @param	behaviour
		 * @param	autoDispose, dispose your Behaviour after being executed first time.
		 */
		public function addBehaviour(type:String, behaviour:Class, autoDispose:Boolean = false):void
		{
			behaviours[type] = new behaviour();
			behaviours[type].initialise(emiter, type, slots);
			if (autoDispose) behaviours[type].remove = removeBehaviour;
		}
		
		/**
		 * 
		 * @param	type
		 */
		public function removeBehaviour(type:String):void
		{
			behaviours[type].dispose();
			delete behaviours[type]
		}
		
		/**
		 * Unique identifier of this Compound
		 */
		public function get uid():String 
		{
			return _uid;
		}
		
		/**
		 * Start Compound with a specific signal type.
		 * @param	type
		 * @param	params
		 */
		public function sendSignal(type:String, params:Array = null):void
		{
			if (params) signal.params = params;
			
			emiter.broadcast(slots.a, type, signal);
			emiter.broadcast(slots.v, type, signal);
			emiter.broadcast(slots.c, type, signal);
		}
		
		public function get module():Boolean 
		{
			return _module;
		}
	}

}