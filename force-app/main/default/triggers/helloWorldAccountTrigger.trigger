/**
 * @File Name          : helloWorldAccountTrigger.trigger
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 11/14/2019, 1:15:42 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    11/14/2019   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
trigger helloWorldAccountTrigger on Account
(before insert) {
MyHelloWorld.addHelloWorld(Trigger.new);
System.debug('How are you');
}