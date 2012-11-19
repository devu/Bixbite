package org.bixbite.core.interfaces 
{
	import org.bixbite.core.Channel;
	import org.bixbite.core.Signal;
	import org.bixbite.core.Slots;
	/**
	 * ...
	 * @author Daniel Wasilewski
	 */
	public interface IEmiter 
	{
		
		function registerComponent(component:Class, singleton:Boolean = true):void;
		
		function unregisterComponent(component:Class):void;
		
		function addSlot(channel:Channel, callerUID:String, type:String, callback:Function):void;
		
		function removeSlot(channel:Channel, callerUID:String, type:String):void;
		
		function removeAllSlots(channel:Channel, type:String):void;
		
		function removeAllSlotsOf(channel:Channel, uid:String):void;
		
		function broadcast(channel:Channel, type:String, signal:Signal):void;
		
		function broadcastM(cid:String, type:String, signal:Signal):void;
		
		function dataBroadcast(channel:Channel, type:String, data:IData):void;
		
		function response(channel:Channel, targetUID:String, type:String, signal:Signal):void;
		
		function dataResponse(channel:Channel, targetUID:String, type:String, data:IData):void;
		
		function getSlots(channel:Channel, type:String):Slots;
		
		function destroy():void;
		
		function get channelE():Function;
		function set channelE(value:Function):void;
		
		function get coreID():String;
		function set coreID(value:String):void;
		
		function get channelV():Channel;
		
		function get channelT():Channel;
		
		function get channelD():Channel;
		
		function get channelC():Channel;
		
		function get uid():int;
	}
	
}