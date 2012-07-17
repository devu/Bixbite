package org.bixbite.framework.modules.assetloader.data 
{
	/**
	 * ...
	 * @author Daniel Wasilewski
	 */
	public interface IAsset 
	{
		function load(onComplete:Function = null, onSkip:Function = null):void;
		function isLoaded():Boolean;
		function isLoading():Boolean;
		function isInitialised():Boolean;
		function set initialised(value:Boolean):void;
		function get content():*;
		function get name():String;
		function get source():String;
	}
	
}