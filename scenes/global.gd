extends Node
var spawn = false
var drawing=false
var totalscore=0
var idle = false
var pastcolor = []
var pastposition = []
var hiltpositions = []
var hiltcolors = []
var handlepositions = []
var handlecolors = []
var bladepositions = []
var bladecolors = []
var qualityblade = 0
var qualityhilt=0
var qualityhandle=0
var wantedcolorhilt=Color(0.85,0,0) #default is black
var wantedcolorhandle=Color(0.85,0,0)
var wantedcolorblade=Color(0.85,0,0)
var wantedcoloramountblade=-1 #-1 is none 0 is not specified(>1 pixel) 1 is a bit 2 is some 3 is a good amount 4 is a lot
var wantedcoloramounthilt=-1
var wantedcoloramounthandle=-1
var bladesharpnessmax
var wantedsharpnesshandle=0 #sharp is 0 no specification 1 is sharp 2 is dull 
var customercounter=1 #the amount of customers you have served and the number of the customer you are serving right now
# Called when the node enters the scene tree for the first time.
