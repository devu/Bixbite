package examples.userinterface 
{
	import org.bixbite.core.Compound;
	import org.bixbite.framework.modules.inputManager.UserInputManager;
	import org.bixbite.framework.view.ui.Window;
	
	/**
	 * ...
	 * @author Daniel Wasilewski
	 */
	public class MainUI extends Compound 
	{
		
		public function MainUI() 
		{
			var input:UserInputManager = new UserInputManager();
			
			var window:Window = new Window(stageView);
		}
		
	}

}