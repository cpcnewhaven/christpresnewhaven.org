/***********************************************
* AnyLink Drop Down Menu- ? Dynamic Drive (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

//Contents for In New Haven For The World
var menu1=new Array()
menu1[0]='<a href="InNewHavenForTheWorld.htm" class="main"><b>In New Haven for the World</b></a>'
menu1[1]='<a href="CommunityLinks.htm" class="main"><b>Community Links</b></a>'
menu1[2]='<a href="http://www.hopefornewhaven.org/" target="_blank" class="main"><b>Hope For New Haven</b></a>'
menu1[3]='<a href="foodforthought.htm" class="main"><b>Weekly Food For Thought: A Community<br>&nbsp;Dinner and Public Conversation</b></a>'
menu1[4]='<a href="MissionProjects.htm" class="main"><b>Mission Projects</b></a>'
menu1[5]='<a href="http://web.mac.com/rebekahcaldwell/iWeb/Site/Welcome.html" target="_blank" class="main"><b>CPC Bookstore / Coffeehouse</b></a>'

//Contents for Get Connected
var menu2=new Array()
menu2[0]='<a href="GetConnected.htm" class="main"><b>Get Connected</b></a>'
menu2[1]='<a href="NeighborhoodGroups.htm" class="main"><b>Neighborhood Groups</b></a>'
menu2[2]='<a href="MembershipAtCPC.htm" class="main"><b>Membership at CPC</b></a>'
menu2[3]='<a href="YouthMinistries.htm" class="main"><b>CPC Youth</b></a>'
menu2[4]='<a href="CollegeGroup.htm" class="main"><b>CPC College</b></a>'
menu2[5]='<a href="GradFellowship.htm" class="main"><b>CPC Grad. Student Fellowship</b></a>'
menu2[6]='<a href="CPCAlumni.htm" class="main"><b>CPC Alumni</b></a>'
menu2[7]='<a href="WomensMinistry.htm" class="main"><b>CPC Women</b></a>'
menu2[8]='<a href="MensMinistry.htm" class="main"><b>CPC Men</b></a>'
menu2[9]='<a href="ServantLeaders.htm" class="main"><b>Servant Ministry</b></a>'
menu2[10]='<a href="CalendarOfEvents.htm" class="main"><b>CPC Calendar of Events</b></a>'
menu2[11]='<a href="ContactCPC.htm" class="main"><b>Contact CPC</b></a>'

//Contents for Worship and Worship Arts
var menu3=new Array()
menu3[0]='<a href="Worship-WorshipArts.htm" class="main"><b>Worship and Worship Arts</b></a>'
menu3[1]='<a href="AboutOurWorship.htm" class="main"><b>About Worship at CPC</b></a>'
menu3[2]='<a href="Sermons&WorshipFolders.htm" class="main"><b>Sermons</b></a>'
menu3[3]='<a href="MusicTeam.htm" class="main"><b>Music Team</b></a>'
menu3[4]='<a href="ArtsFellowship.htm" class="main"><b>Arts Fellowship</b></a>'
menu3[5]='<a href="WorshipResources.htm" class="main"><b>Worship Resources</b></a>'

//Contents for CPC Study Center
var menu4=new Array()
menu4[0]='<a href="StudyCenter.htm" class="main"><b>CPC Study Center</i></b></a>'
menu4[1]='<a href="foodforthought.htm" class="main"><b>Weekly <i>Food For Thought</i></b></a>'
menu4[2]='<a href="Seminars.htm" class="main"><b>Seminars and Classes</b></a>'
menu4[3]='<a href="StudyCenterLinks.htm" class="main"><b>Study Resources and Links</b></a>'
menu4[4]='<a href="StudyCenterLibrary.htm" class="main"><b>Study Center Library</b></a>'
menu4[5]='<a href="SpecialEvents.htm" class="main"><b>Special Events</b></a>'
menu4[6]='<a href="Interships.htm" class="main"><b>Internships</b></a>'
menu4[7]='<a href="http://web.mac.com/rebekahcaldwell/iWeb/Site/Welcome.html" target="_blank" class="main"><b>CPC Bookstore / Coffeehouse</b></a>'

//Contents for Questions & Answers
var menu5=new Array()
menu5[0]='<a href="Questions&Answers.htm" class="main"><b>Questions and Answers</b></a>'
menu5[1]='<a href="WhyGod.htm" class="main"><b>Why God?</b></a>'
menu5[2]='<a href="WhatAboutOtherGods.htm" class="main"><b>What about ?other? Christianities/Gospels?</b></a>'
menu5[3]='<a href="IsReligionAPrivateValueOrPublicFact.htm" class="main"><b>Is religion a private value or public fact?</b></a>'
menu5[4]='<a href="IsFaithCompatibleWithScience.htm" class="main"><b>Is Faith Compatible With Science?</b></a>'
menu5[5]='<a href="IsGodPresentInTheWorld.htm" class="main"><b>Is God present in the world?</b></a>'
menu5[6]='<a href="WhichGod.htm" class="main"><b>Which God?<br>&nbsp;(The Issue of Pluralism)</b></a>'
menu5[7]='<a href="IsntReligionAProblemForWorldPeace.htm" class="main"><b>Isn?t Religion a problem for world peace?</b></a>'
menu5[8]='<a href="HowCanIKnowGod.htm" class="main"><b>How can I know God?</b></a>'
menu5[9]='<a href="WhyChurch.htm" class="main"><b>Why Church?</b></a>'
menu5[10]='<a href="WhatIsCPCAllAbout.htm" class="main"><b>What is CPC All About?</b></a>'
menu5[11]='<a href="HowCanIParticipateAtCPC.htm" class="main"><b>How to Get Involved at CPC?</b></a>'
		
var menuwidth='165px' //default menu width
var menubgcolor='lightyellow'  //menu bgcolor
var disappeardelay=250  //menu disappear speed onMouseout (in miliseconds)
var hidemenu_onclick="yes" //hide menu when user clicks within menu?

/////No further editting needed

var ie4=document.all
var ns6=document.getElementById&&!document.all

if (ie4||ns6)
document.write('<div id="dropmenudiv" style="visibility:hidden;width:'+menuwidth+';background-color:'+menubgcolor+'" onMouseover="clearhidemenu()" onMouseout="dynamichide(event)"></div>')

function getposOffset(what, offsettype){
var totaloffset=(offsettype=="left")? what.offsetLeft : what.offsetTop;
var parentEl=what.offsetParent;
while (parentEl!=null){
totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
parentEl=parentEl.offsetParent;
}
return totaloffset;
}


function showhide(obj, e, visible, hidden, menuwidth){
if (ie4||ns6)
dropmenuobj.style.left=dropmenuobj.style.top="-500px"
if (menuwidth!=""){
dropmenuobj.widthobj=dropmenuobj.style
dropmenuobj.widthobj.width=menuwidth
}
if (e.type=="click" && obj.visibility==hidden || e.type=="mouseover")
obj.visibility=visible
else if (e.type=="click")
obj.visibility=hidden
}

function iecompattest(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function clearbrowseredge(obj, whichedge){
var edgeoffset=0
if (whichedge=="rightedge"){
var windowedge=ie4 && !window.opera? iecompattest().scrollLeft+iecompattest().clientWidth-15 : window.pageXOffset+window.innerWidth-15
dropmenuobj.contentmeasure=dropmenuobj.offsetWidth
if (windowedge-dropmenuobj.x < dropmenuobj.contentmeasure)
edgeoffset=dropmenuobj.contentmeasure-obj.offsetWidth
}
else{
var topedge=ie4 && !window.opera? iecompattest().scrollTop : window.pageYOffset
var windowedge=ie4 && !window.opera? iecompattest().scrollTop+iecompattest().clientHeight-15 : window.pageYOffset+window.innerHeight-18
dropmenuobj.contentmeasure=dropmenuobj.offsetHeight
if (windowedge-dropmenuobj.y < dropmenuobj.contentmeasure){ //move up?
edgeoffset=dropmenuobj.contentmeasure+obj.offsetHeight
if ((dropmenuobj.y-topedge)<dropmenuobj.contentmeasure) //up no good either?
edgeoffset=dropmenuobj.y+obj.offsetHeight-topedge
}
}
return edgeoffset
}

function populatemenu(what){
if (ie4||ns6)
dropmenuobj.innerHTML=what.join("")
}


function dropdownmenu(obj, e, menucontents, menuwidth){
if (window.event) event.cancelBubble=true
else if (e.stopPropagation) e.stopPropagation()
clearhidemenu()
dropmenuobj=document.getElementById? document.getElementById("dropmenudiv") : dropmenudiv
populatemenu(menucontents)

if (ie4||ns6){
showhide(dropmenuobj.style, e, "visible", "hidden", menuwidth)
dropmenuobj.x=getposOffset(obj, "left")
dropmenuobj.y=getposOffset(obj, "top")
dropmenuobj.style.left=dropmenuobj.x-clearbrowseredge(obj, "rightedge")+"px"
dropmenuobj.style.top=dropmenuobj.y-clearbrowseredge(obj, "bottomedge")+obj.offsetHeight+"px"
}

return clickreturnvalue()
}

function clickreturnvalue(){
if (ie4||ns6) return false
else return true
}

function contains_ns6(a, b) {
while (b.parentNode)
if ((b = b.parentNode) == a)
return true;
return false;
}

function dynamichide(e){
if (ie4&&!dropmenuobj.contains(e.toElement))
delayhidemenu()
else if (ns6&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
delayhidemenu()
}

function hidemenu(e){
if (typeof dropmenuobj!="undefined"){
if (ie4||ns6)
dropmenuobj.style.visibility="hidden"
}
}

function delayhidemenu(){
if (ie4||ns6)
delayhide=setTimeout("hidemenu()",disappeardelay)
}

function clearhidemenu(){
if (typeof delayhide!="undefined")
clearTimeout(delayhide)
}

if (hidemenu_onclick=="yes")
document.onclick=hidemenu


function setActiveStyleSheet(title, reset) {
	var i, a, main;
	for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
		if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title")) {
			a.disabled = true;
			if(a.getAttribute("title") == title) a.disabled = false;
		}
	}
	if (reset == 1) {
		createCookie("page_style", title, 365);
	}
}

function setStyle() {
	var style = readCookie("page_style");
	if (style != null) {
		setActiveStyleSheet(style, 0);
	} else {
		setActiveStyleSheet("textSizeSml", 0);
	}
}

function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = ";expires="+date.toGMTString();
	}
	else expires = "";
	document.cookie = name+"="+value+expires+";domain=clients.groupsomma.com;path=/;";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}