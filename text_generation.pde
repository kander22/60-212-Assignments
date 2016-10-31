import rita.*;
String entries[] = new String[30];
JSONObject json;

void setup() {
  //basically just initializes all the craiglist entries I'll be using

  entries[0] = "Im in search of a beautiful young woman between the age of does not matter-23 who is seeking an older man for a relationship and to treat her like a princess inside and outside of the bedroom. She should be tall have long hair long legs and a gorgeous butt and on birth control, highly recommended but not a deal breaker. She will receive alot of presents and affection . I am very serious about treating a very special young lady this way and if your interested I expect you to be very serious about accepting. SERIOUS REPLIES ONLY. Send a full clothed body pic with face along with stats. The closer you are to me the more you will be spoiled. Your pic will get mine once you prove your serious enough.";
  entries[1] = "I have a big, roomy Suv and I've got a taste kink. Any women out there feel the same way? I've got all the time in the world today and I'm looking to have some fun. Put your favorite color in the subject line so I know you're not a bot. Let's chat a little bit and see what we'd like to do on this dreary day.";
  entries[2] =
    "I think it's finally reached the point where i should throw in the towel with craigslist. I get "
    +"almost no replies from real people. I used to at least get the occasional interesting reply or two." 
    +" I'm bored. Are you tired of the same old/same old too? Let's talk and take it from there. I'm " 
    + "pretty open-minded even if that means we just talk. Please reply with a picture and a little about"
    + " yourself. Excuse the cheesy pictures, but I'm not putting my face on cl so I figured these were" 
    + " better than nothing. Note: Someone stole one of my pics and is using it to post ads. If you see an"
    + " ad with my picture talking about bi-guys, bi-girls, and hsv...know that it is NOT me. I am not bi."
    + " I do not have hsv. Nothing in the ad is true about me. That is someone using my picture without my"
    + " permission.";

  entries[3] = "Hi! Is anyone else bored tonight? It's so nice outside. Anyways... I'm new-ish to the area and have"
    + " been single for about a year. I miss cuddling and making out. Anyone up for a movie late tonight? I" 
    + " am. Who me? 33, white, attractive, 6'1, financially stable, four twenty friendly, movie lover," 
    + " crazy about kissing.You? Pic for pic! Yours gets mine." 
    + " Ps you can pick the movie.";

  entries[4] = "Swm, 6' tall, average looks, good body, tight tush, great sense of humor, will buy dinner for any" 
    + " female on one condition: you wear a skirt and hose/nylons. I bet I will be eating alone tonight.";

  entries[5] = "Oh it has a first name!!"
    + " Looking for a fwb scenario so my kabossy can fit that bun!!"
    + " Ideally we meeta few times xa week and have bottle rocket sex."
    + " I have skills that will blow you're mind."
    + " In fact if you don't get with me you're missing out on the treat of a lifetime." 
    + " My kabossy is in charge!!";

  entries[6] = "hello , Im 33 yo white male , 6ft1 180lbs, SINGLE ,in good shape,two part time jobs,no kids,been" 
    + " told im goodlooking.looking for a Long term relationship . I have my own place and i drive.. I am a" 
    + " country/redneck/metalhead type guy all wrapped in one...some fav bands...Misfits,Metallica,Social" 
    + " D, Dropkick Murphys, AC-DC, Disturbed, Fear Factory, and thats all i can think of right now.I have" 
    + " 4 tattoos, one on right bicep and 3 on left forearm, id like to get more in the future...I am" 
    + " hoping to meet the right one in 2016 since its been a few years since ive had a relationship...Not"
    + " looking for liars , whores , wana be gangsters , gold diggers , game players ,and drama queens, or" 
    + " women still attached to their ex.";

  entries[7] = "Me:"
    + " I am tall, in shape, and intelligent. I hear I am easy on the eyes, and have all of my teeth. I"
    + " have a decent job and my own place, although I am new to the area. I am 420 friendly, but other" 
    + " wise drug free. I am disease and drama free as well and have no kids or anything."
    + " You:"
    + " Honesty is pretty crucial."
    + " Cute although you dont exactly have to think so haha"
    + " Smart"
    + " Job, car, school, art, or something you do with your life"
    + " 420 friendly is a plus"
    + " Piercings and tattoos are also a plus"
    + " Disease/kid/drama free";

  entries[8] = "Anyone up late this evening and want to chat and see where it leads? Maybe make a friend or maybe" 
    + " something more? Send me an email so we can chat! I am open to any age, relationship status, race," 
    + " etc. as long as you are female lol so don't be shy :)";

  entries[9] = "Anybody feel like hangin out and having good conversation? We could talk about anything you feel" 
    + " like.";

  entries[10] ="I'm white male regular build not bad looking. I have no tats, no piercings, never married, no kids." 
    + " No crazy friends, no crazy ex's. I'm more of a homebody and stay out of trouble. I like going out "
    + " to all depending on what to do. I'm looking for someone to talk too who is just a normal regular "
    + " person,"
    + " I'm friendly and nice. Down to earth and chill. If you wanna know more..."
    + " Put 'email' in subject line or send me a text"
    + " FOUR ONE TWO NINE FIVE ONE FOUR FIVE SEVEN TWO";


  entries[11] = "Hey ladies, I guess I just wanna keep it quick and to the point lol. I'm not looking for a"
    + " relationship or anything serious, just a girl to hangout and mess around with on occasion. If you"
    + " would be interested in that kind of thing reply to my post and let's see what happens. Please"
    + " attach a picture of yourself and put your boob size in the subject line so I know you're legit.";

  entries[12] = "I am not picky tonight. Invite me over already. I can travel to you if things feel right.";

  entries[13] = "Hi There!! I am from California... I live in San Diego, I've always wanted to travel but I haven't" 
    + " been here :/ only through CL haha... But I don't want to go without finding someone who I can trust"
    + " and who can show me around so I have a good time :)"
    + " Possibly to meet and have a connection."
    + " About Me: I'm a chubby white guy, long blond hair and blue eyes :)" 
    + " I'm 27, have a good job and I'm easy going."
    + " You can email me or KIK me at"
    + " Tcandee";

  entries[14] = "Contact me tonight....discreet fun wanted..I'm in shape,sense of humor, 40s..text 'I'm in' to"
    + " fouronetwothreeeightninetwoonefivesix. Married / attached ,couples welcome";

  entries[15] = "Howz about a nice collaboration between friends? We can have pizza pie as I spice it up with my" 
    + " sausage as the perfect ingredient.";

  entries[16] = "Hey anybody want to get together tonight? We can catch a movie or do oral? We can Iggy wiggy liol.";

  entries[17] = "I am at the point where making time to slowdown, relax and enjoy is important, I like the" 
    + " interaction of dinning in, dinning out, the connection created by preparing and sharing a meal" 
    + " together, an evening set aside for a nice wine, conversation, candles, teasing, pleasing and an" 
    + " antipasto to nibble on. Lol";

  entries[18] = "Laughter is important, my sense of humor can range from playful to sarcastic. Not looking to change" 
    + " my life or anyone else's other than filling the void. Passionate, expressive and looking for the"
    + " same. Definitely not an out of sight out of mind person, I like to keep in touch throughout the" 
    + " day, share thoughts, feelings and events. For me the mental connection is important and" 
    + " communication is key. I don't mean to offend anyone but please be local to the Pittsburgh area," 
    + " over 45, ready to slowdown and enjoy, willing and able to make time to do so and looking to share" 
    + " and enjoy plenty of pleasure, passion and fun. If interested message me, put your favorite wine in" 
    + " the subject line, please include a photo, what you're looking for, what you enjoy/find pleasure in" 
    + " and PLEASE!!! Be serious and looking for something regular and ongoing, the more we have to build" 
    + " on the hotter it will get. Thank you.";

  entries[19] = "would love to be a live in companion and a lover to a naughty older woman 60-85,any race," 
    + " religion. I am an east Indian male NY raised 55 years old and an American citizen. I don't have" 
    + " Indian accent when I speak English and I have an MBA. I need a place to stay. I will caress you" 
    + " allover, give full body massages, give you great sex, cook and your chores. Please respond with" 
    + " your phone number.";

  entries[20] = "For reals. I love breast play. Yours, not mine lol. Hoping to find someone out there that loves" 
    + " having your nipples sucked. Such a turn on for me. Well and kissing too." 
    + " I can drive or host. Anyone curious? Please include a face picture of yourself and I'll return the" 
    + " favor. Thanks!";

  entries[21] = "Ok who on this site really wants to meat? Let's meat today and meat consistently if that's okay. So" 
    + " let's do this.";

  entries[22] = "I'm a nightime person who likes to stay up past midnight. Any women on here looking to chat who" 
    + " likes to stay up past midnight? If so put midnight in subject line";

  entries[23] = "Looking for guys and girls who want to throw down some fun. We got the dunking stix so you supply" 
    + " the honey buns.";

  entries[24] = "So as I have stated just out of a bad relationship. My ex just could not understand my experiments" 
    + " with men. So maybe you will understand? Hey we all have needs right?";

  entries[25] = "I'm looking for a nice young thick girl to spoil and give gifts to. This can be one time or" 
    + " ongoing. Please no bbw. Please reply with favorite color in subject. Also send pics and a phone #";

  entries[26] = "This is a long shot I know. And I know most if not all of you that read this will judge and form" 
    + " your opinions. That's okay. Hopefully there is one woman out there that is adventurous and open" 
    + " minded enough or maybe in a similar situation that they understand."
    + " I guess I will just lay it all out on the table. I am a 54 yr old married man. Due to wife's lack" 
    + " of interest, there hasn't been much in the way of 'sex' for quite some time. My release comes from," 
    + " you guessed it, masturbation. I am looking for a woman who is possibly in the same situation that" 
    + " might be interested in getting together for some mutual masturbation. Not looking for intercourse." 
    + " We could watch each other or we could lend a hand and help each other. The choice would be yours." 
    + " Absolute discretion is a must !! Prefer you be over 40 yrs old. Married or single. If this sounds" 
    + " like something you would like to possibly discuss, please send me an email and tell me your" 
    + " thoughts on the subject and we can go from there. Women Only Please !!!!";

  entries[27] = "Are there any cute girls out there who might be interested in a tribute? If you don't know what" 
    + " that is it is when a girl sends a sexy pic or 2 to a guy who then drops his load on the picture and" 
    + " takes a picture of that and sends it back to the girl."
    + " It's just a fun flirty activity and doesn't require any personal meets or anything like that. If" 
    + " this is something you'd be interested in please send me a pic and what you're looking for and" 
    + " please put tribute in the title so I know you're real."
    + " I'm real -- today is Friday and has been sunny but cooler but the weekend will warm up nicely.";

  entries[28] = "I am a mature, married busy workaholic & needing assistance with stress relief from time to time. I" 
    + " am seeking a steady & reliable massage therapist( don't worry about experience, I can teach you the" 
    + " techniques) who can host with great hands for a good sensual full body massage at least once a" 
    + " week. No need to look for a p/t job, do more with the time saved and let's help each other out." 
    + " Deal with one sane and decent guy, no need to hook up with random men. Ideal candidate would be a" 
    + " woman who is uninhibited with a great sense of humor and understands the need for privacy. Looking" 
    + " to start soon. This is a perfect opportunity for stay at home mom (after the kids are at school)" 
    + " retired woman( age is not an issue), college student or any woman looking to supplement her income." 
    + " I have a flexible schedule which will enable us to work around yours. Please put relief in subject"
    + " line so I will know that you are real and sincere.";


  entries[29] = "Quit flagging and sending racist emails, haters. Live and let live."
    + " Some guys like blondes. Some guys like BBWs. I prefer ladies who have a darker skin tone. Don't ask" 
    + " me why. Don't know. Don't care. And it isn't just a phase. I haven't dated a white woman in 10"
    + " years. I'm not looking for anything serious (though I definitely want to keep the option open) nor" 
    + " am I interested in anything financial including a SD/SB arrangement."
    + " What I'm seeing is a situation where we get dinner sometimes, or a happy hour. We catch a movie," 
    + " hear some live music. And there is lots of naked time. We aren't up under each other all the time," 
    + " but we're friends, confidants and lovers. I'm college educated, been told I have a good sense of" 
    + " humor and can usually keep up on the conversation."
    + " Anyway, if that has a beat for you, drop me a note. Put 'Maybe I'm the one' in the subject and"
    + " lets's get coffee."
    + " Please make the subject of your reply something interesting so i know ur not a dbag or spam bot."
    + " Thanks.";

  json = new JSONObject();
  for (int i = 0; i < 30; i++) {
    String result[] = RiTa.splitSentences(entries[i]);
    String sent = result[int(random(0, result.length))];
    json.setInt("id", i);
    json.setString("sentence", sent);
    String add = str(i);
    saveJSONObject(json, "data/text" + add+ ".json");
  }
}