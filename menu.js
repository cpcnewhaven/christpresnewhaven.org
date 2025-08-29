var i;

var mainMenuIds;
var mainMenuText;
var subMenuIds;
var subMenuText;

var welcomeOpacity = 0;

// Init Global Vars
var numMenuItems = 9;
var mainMenuIds = 	new Array(numMenuItems);
var mainMenuText = 	new Array(numMenuItems);
var mainMenuUrls = 	new Array(numMenuItems);

var subMenuIds = 	new Array(numMenuItems);
var subMenuText = 	new Array(numMenuItems);
var subMenuUrls = 	new Array(numMenuItems);
for (i=0;i<numMenuItems;i++){
  subMenuIds[i] = 	new Array(numMenuItems);
  subMenuText[i] = 	new Array(numMenuItems);
  subMenuUrls[i] = 	new Array(numMenuItems);
}

// Main Menu
mainMenuIds[0] = "STUDYCENTER";		mainMenuText[0] = "Study Center";			mainMenuUrls[0] = "stsindex.html";
mainMenuIds[1] = "MAPS";		mainMenuText[1] = "Maps and Directions";		mainMenuUrls[0] = "mapindex.html"
mainMenuIds[2] = "BASICQ";		mainMenuText[2] = "Basic Questions";			mainMenuUrls[0] = "basindex.html"
mainMenuIds[3] = "ABOUTUS";		mainMenuText[3] = "About Us";				mainMenuUrls[0] = "abtindex.html"
mainMenuIds[4] = "MISSIONTONH";		mainMenuText[4] = "Mission to New Haven";		mainMenuUrls[0] = "misindex.html"
mainMenuIds[5] = "WINDOW";		mainMenuText[5] = "The Window (Newsletter)";		mainMenuUrls[0] = "winindex.html"
mainMenuIds[6] = "CURRENTACT";		mainMenuText[6] = "Current Activities";			mainMenuUrls[0] = "othindex.html"
mainMenuIds[7] = "MEDIA";		mainMenuText[7] = "Media";				mainMenuUrls[7] = "medindex.html";

// Study Center
//subMenuIds[0][0] = "FEATSERMON";	subMenuText[0][0] = "Featured Sermon (audio)";		subMenuUrls[0][0] = "sts/featsermonindex.html";
subMenuIds[0][0] = "CLASSES";		subMenuText[0][0] = "Classes";				subMenuUrls[0][0] = "sts/currentclassesindex.html";
subMenuIds[0][1] = "LEADERSHIP";	subMenuText[0][1] = "Leadership Training";		subMenuUrls[0][1] = "sts/leadershiptrainingindex.html";
subMenuIds[0][2] = "FAITHPRACT";	subMenuText[0][2] = "Christian Faith and Practice";	subMenuUrls[0][2] = "sts/cfpindex.html";
subMenuIds[0][3] = "PAPERS";		subMenuText[0][3] = "Papers";				subMenuUrls[0][3] = "sts/paperindex.html";
subMenuIds[0][4] = "PAMPHLETS";		subMenuText[0][4] = "Pamphlets";			subMenuUrls[0][4] = "sts/pamphletindex.html";
subMenuIds[0][5] = "CATALOGUE";		subMenuText[0][5] = "Library Catalogue";		subMenuUrls[0][5] = "sts/librarycatalogueindex.html";
subMenuIds[0][6] = "LINKS";		subMenuText[0][6] = "Links";				subMenuUrls[0][6] = "sts/linkindex.html";
subMenuIds[0][7] = "REDEMPTION";	subMenuText[0][7] = "Stories of Redemption";		subMenuUrls[0][7] = "sts/stoindex.html";

// Maps & Directions
subMenuIds[1][0] = "TOCHAPEL";		subMenuText[1][0] = "To the Chapel & Study Center";	subMenuUrls[1][0] = "map/cpcmapindex.html";

// Basic Questions
subMenuIds[2][0] = "QAPASTOR";		subMenuText[2][0] = "Q & A with Our Pastor";		subMenuUrls[2][0] = "bas/QnAwithourpastor.htm";

// About Us
subMenuIds[3][0] = "STATEMENTID";	subMenuText[3][0] = "Statement of Identity";		subMenuUrls[3][0] = "abt/soi.html";
subMenuIds[3][1] = "INTROTOCPC";	subMenuText[3][1] = "Introduction to CPC";		subMenuUrls[3][1] = "abt/CPCIntroduction.pdf";
//subMenuIds[3][2] = "OURWORSHIP";	subMenuText[3][2] = "Our Worship";			subMenuUrls[3][2] = "worindex.html";
subMenuIds[3][2] = "REGSTRATEGY";	subMenuText[3][2] = "Regional Strategy";		subMenuUrls[3][2] = "abt/regional.html";
subMenuIds[3][3] = "HISTORY";		subMenuText[3][3] = "History of CPC";			subMenuUrls[3][3] = "abt/cpchistory.html";
subMenuIds[3][4] = "CHILDREN";		subMenuText[3][4] = "Children and Youth at CPC";	subMenuUrls[3][4] = "abt/ministrydirectoryindex.html";
subMenuIds[3][5] = "INNEWS";		subMenuText[3][5] = "In the News";			subMenuUrls[3][5] = "http://www.pcanet.org/mna/multiply/multiply2002/spring2002/spring2002.htm#NewHaven";

// Mission to New Haven
subMenuIds[4][0] = "SLIDESHOW";		subMenuText[4][0] = "Slideshow";			subMenuUrls[4][0] = "mis/mnhslideshow/mnh_files/v3_document.htm";
subMenuIds[4][1] = "HOPEFORNH";		subMenuText[4][1] = "Hope for New Haven";		subMenuUrls[4][1] = "mis/hnhindex.html";
subMenuIds[4][2] = "CAMPUSMIN";		subMenuText[4][2] = "Campus Ministry";			subMenuUrls[4][2] = "rufindex.html";
subMenuIds[4][3] = "SUPCAMPUSMIN";	subMenuText[4][3] = "How to Support Campus Ministry";	subMenuUrls[4][3] = "mis/supporters.htm";

// The Window
subMenuIds[5][0] = "WINTER05";		subMenuText[5][0] = "Winter 2005";			subMenuUrls[5][0] = "win/thewindow_7-1_web.pdf";
subMenuIds[5][1] = "SUMMER05";		subMenuText[5][1] = "Summer 2005";			subMenuUrls[5][1] = "win/thewindow_6-2_web.pdf";
subMenuIds[5][2] = "WINTER04";		subMenuText[5][2] = "Winter 2004";			subMenuUrls[5][2] = "win/thewindow_6-1_web.pdf";
subMenuIds[5][3] = "SPRING03";		subMenuText[5][3] = "Spring 2003";			subMenuUrls[5][3] = "win/thewindow_5-1_web.pdf";
subMenuIds[5][4] = "SUMMER02";		subMenuText[5][4] = "Summer 2002";			subMenuUrls[5][4] = "win/thewindow_4-1_web.doc";
subMenuIds[5][5] = "FALL01";		subMenuText[5][5] = "Fall 2001";			subMenuUrls[5][5] = "win/thewindow_3-3_web.doc";
subMenuIds[5][6] = "SUMMER01";		subMenuText[5][6] = "Summer 2001";			subMenuUrls[5][6] = "win/thewindow_3-2_web.doc";
subMenuIds[5][7] = "FALL00";		subMenuText[5][7] = "Fall 2000";			subMenuUrls[5][7] = "win/thewindow_2-3_web.pdf";
subMenuIds[5][8] = "SUMMER00";		subMenuText[5][8] = "Summer 2000";			subMenuUrls[5][8] = "win/thewindow_2-2_web.pdf";
//subMenuIds[5][9] = "WINTER00";		subMenuText[5][9] = "Winter 2000";			subMenuUrls[5][9] = "win/thewindow_2-1_web.pdf";
//subMenuIds[5][10]= "FALL99";		subMenuText[5][10]= "Fall 1999";			subMenuUrls[5][10]= "win/thewindow_1-3_web.pdf";
//subMenuIds[5][11]= "SUMMER99";		subMenuText[5][11]= "Summer 1999";			subMenuUrls[5][11]= "win/thewindow_1-2_web.pdf";

// Current Activities
subMenuIds[6][0] = "BULLETIN";		subMenuText[6][0] = "Bulletin Announcements";		subMenuUrls[6][0] = "oth/bulletinannouncements.htm";
subMenuIds[6][1] = "CALENDAR";		subMenuText[6][1] = "Church Calendar";			subMenuUrls[6][1] = "oth/churchcalendar.htm";
subMenuIds[6][2] = "SMALLGRP";		subMenuText[6][2] = "Small Group Fellowships";		subMenuUrls[6][2] = "sts/smallgroupsindex.html";
subMenuIds[6][3] = "CLASSES";		subMenuText[6][3] = "Classes";				subMenuUrls[6][3] = "sts/currentclassesindex.html";
subMenuIds[6][4] = "REGEVENTS";		subMenuText[6][4] = "Regular Events";			subMenuUrls[6][4] = "oth/regulareventsindex.html";
subMenuIds[6][5] = "SFELLOWSHPS";	subMenuText[6][5] = "Special Fellowships";		subMenuUrls[6][5] = "oth/fellowshipgroupsindex.html";
subMenuIds[6][6] = "TEAMSCHED";		subMenuText[6][6] = "Team Schedules";			subMenuUrls[6][6] = "oth/teamschedulesindex.html";

// Media
subMenuIds[7][0] = "SAMPLEOFWOR";		subMenuText[7][0] = "Sample Order of Worship";			subMenuUrls[7][0] = "abt/sampleorderofworship.pdf";
subMenuIds[7][1] = "INTOTHYLT";		subMenuText[7][1] = "Into Thy Light - CD Project";			subMenuUrls[7][1] = "cd/";
subMenuIds[7][2] = "DOWNLOAD";		subMenuText[7][2] = "Downloadable Sermons (MP3)";	subMenuUrls[7][2] = "sts/sermons/downloadsindex.html";
subMenuIds[7][3] = "WORARTS";		subMenuText[7][3] = "Music and Worship Arts";	subMenuUrls[7][3] = "abt/worshiparts.html";

for (i=0;i<numMenuItems;i++){
  document.write('<div id=' + mainMenuIds[i] + 'DIV style="position:absolute;top:0;left:0;display:none;"></div>');
}


// ========= MENU FUNCTIONS =================================
function initMenus() {
	var i, j, k, menuLeft, menuTop, xOffset, yOffset, numNbsp;
	var menuHtml;
	var menuDiv, menuTD;
	
	for (i=0; i<numMenuItems; i++){
	  menuHtml = "<table>"
	  menuDiv = document.getElementById(mainMenuIds[i]+"DIV");
	  menuTD = document.getElementById(mainMenuIds[i]);
	  if (menuDiv && menuTD) {
		for (j=0; j<numMenuItems; j++){
			if (subMenuIds[i][j]){
				menuHtml += '<tr><td class=normalsmall style="height:20px" id=' + subMenuIds[i][j] + ' nowrap>';
				numNbsp = 10 * Math.log(j+1);
				for (k=0; k<numNbsp; k++) menuHtml += '&nbsp;';
				menuHtml += '<b><a href="' + subMenuUrls[i][j] + '" class=bluesmall>' + subMenuText[i][j] + '</a></b></td></tr>';
			}
		  }
		  menuHtml += '</table></div>';
	
		  xOffset = (i>0) ? 250 + 35 * Math.log(i) : 250;
		  yOffset = i*j*-3;
		  menuDiv.style.left = findPosX(menuTD) + xOffset;
		  menuDiv.style.top = findPosY(menuTD) + yOffset;
		  menuDiv.innerHTML = menuHtml;
	  }
	}
	showWelcome();
}

function showWelcome(){
	wDiv = document.getElementById('welcomeDIV');
	win = document.getElementById('wincrosstop');
	wDiv.style.left = findPosX(win) + 2;
	wDiv.style.top = findPosY(win) + 2 - (2*20);
	
	wDiv.style.filter = "alpha(opacity="+welcomeOpacity+")";	//IE opacity
	wDiv.style.MozOpacity = welcomeOpacity /100;			//NS opacity
	wDiv.style.display='';
	welcomeFadeIn();
}

function welcomeFadeIn(){
	wDiv = document.getElementById('welcomeDIV');
	if (welcomeOpacity < 100) {
		welcomeOpacity += 5;
		wDiv.style.top = parseInt(wDiv.style.top) + 2;
		wDiv.style.filter = "alpha(opacity="+welcomeOpacity+")";	//IE opacity
		wDiv.style.MozOpacity = welcomeOpacity /100;			//NS opacity
		timer=setTimeout('welcomeFadeIn()',50);
	} else {
		clearTimeout(timer);
		timer=setTimeout('welcomeFadeOut()',10000);
	}
}

function welcomeFadeOut(){
	wTbl = document.getElementById('welcomeTable');
	wTxt = document.getElementById('welcomeText');
	if (welcomeOpacity > 0) {
		welcomeOpacity -= 5;
		wTxt.style.filter = "alpha(opacity="+welcomeOpacity+")";	//IE opacity
		wTxt.style.MozOpacity = welcomeOpacity /100;			//NS opacity
		timer=setTimeout('welcomeFadeOut()',50);
	} else {
		clearTimeout(timer);
		wTbl.style.borderColor="#7c92a9";
		wTxt.style.display='none';
	}
}

function showSubMenu(id) {
	var i;
	var menuDiv = document.getElementById(id+"DIV");
	var menuTD = document.getElementById(id);
	var currMenuDiv, currMenuTD;
	for (i=0;i<numMenuItems;i++){
	  if (mainMenuIds[i] && mainMenuIds[i] != id) {
		currMenuDiv = document.getElementById(mainMenuIds[i]+"DIV");
		//currMenuTD = document.getElementById(mainMenuIds[i]);
		//if (currMenuDiv && currMenuTD) {
		  currMenuDiv.style.display="none";
		//  currMenuTD.style.background = "#ffffff";
		//}
	  }
	}
	menuDiv.style.display = "";
	//menuTD.style.background = "#cccccc";
}

function hideSubMenus() {
	var i;
	for (i=0;i<numMenuItems;i++){
		document.getElementById(mainMenuIds[i]+"DIV").style.display="none";
	}
}

function findPosX(obj)
{
	var curleft = 0;
	if (obj.offsetParent)
	{
		while (obj.offsetParent)
		{
			curleft += obj.offsetLeft
			obj = obj.offsetParent;
		}
	}
	else if (obj.x)
		curleft += obj.x;
	return curleft;
}

function findPosY(obj)
{
	var curtop = 0;
	if (obj.offsetParent)
	{
		while (obj.offsetParent)
		{
			curtop += obj.offsetTop
			obj = obj.offsetParent;
		}
	}
	else if (obj.y)
		curtop += obj.y;
	return curtop;
}
