package org.bixbite.framework.modules.inputManager 
{
	import org.bixbite.core.Compound;
	import org.bixbite.framework.modules.inputManager.transponder.UserInputTransponder;
	
	/**
	 * ...
	 * @author Daniel Wasilewski
	 */
	public class UserInputManager extends Compound 
	{
		
		public function UserInputManager() 
		{
			var inputTransponder:UserInputTransponder = new UserInputTransponder();
		}
		
	}

}