import 'facility.dart';

// Got protein bar image from google images
// Got clark street beach image from: https://www.cityofevanston.org/home/showpublishedimage/15390/637617768863970000

final List<Facility> ListOfFacilities = [
  Facility(
    id: '0', 
    name: 'Protein Bar', 
    openingHours: {
      // Monday to Thursday
      1: '9:00 AM - 7:00 PM',
      2: '9:00 AM - 7:00 PM',
      3: '9:00 AM - 7:00 PM',
      4: '9:00 AM - 7:00 PM',
      // Friday to Saturday
      5: '9:00 AM - 6:00 PM',
      6: '9:00 AM - 6:00 PM',
      // Sunday
      7: '10:00 AM - 5:00 PM',
    },
    image: 'assets/images/protein_bar_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Protein+Bar+%26+Kitchen/@42.0594617,-87.677554,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdb561cd5eb3d:0xd83a6a22b6df80ae!8m2!3d42.0594618!4d-87.6726831!16s%2Fg%2F11rcd8gszx?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%2060208,%20United%20States&auid=11318958517233221556&ll=42.059853,-87.672691&lsp=9902&q=Protein%20Bar%20%26%20Kitchen',
  ),
  Facility(
    id: '1', 
    name: 'Norris Aquatics Center', 
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 10:00 PM',
      2: '6:00 AM - 10:00 PM',
      3: '6:00 AM - 10:00 PM',
      4: '6:00 AM - 10:00 PM',
      // Friday 
      5: '6:00 AM - 9:00 PM',
      // Saturday
      6: '9:00 AM - 8:00 PM',
      // Sunday
      7: '8:00 AM - 6:00 PM',
    },
    image: 'assets/images/norris_aquatics_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Norris+Aquatics+Center/@42.0600471,-87.6734807,17z/data=!3m1!4b1!4m6!3m5!1s0x880fda994fb84527:0x53e48aa61e6edf40!8m2!3d42.0600471!4d-87.6734807!16s%2Fg%2F11r9f2wbf?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=9123114623197736646&ll=42.059273,-87.673765&lsp=9902&q=Norris%20Aquatics%20Center',
  ),
  Facility(
    id: '2', 
    name: 'Ryan Fieldhouse / Wilson Field', 
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 10:00 PM',
      2: '6:00 AM - 10:00 PM',
      3: '6:00 AM - 10:00 PM',
      4: '6:00 AM - 10:00 PM',
      // Friday 
      5: '6:00 AM - 9:00 PM',
      // Saturday
      6: '9:00 AM - 8:00 PM',
      // Sunday
      7: '8:00 AM - 6:00 PM',
    },
    image: 'assets/images/ryan_fieldhouse_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Ryan+Fieldhouse/@42.0594618,-87.6726831,17z/data=!4m6!3m5!1s0x880fdbcfb1554ab3:0x563a04ebfa991cc1!8m2!3d42.060229!4d-87.6725064!16s%2Fg%2F11fcs4s3p4?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2333%20Campus%20Dr,%20Evanston,%20IL%2060208,%20United%20States&auid=3073132621414396731&ll=42.059872,-87.672529&lsp=9902&q=Ryan%20Fieldhouse',
  ),
  Facility(
    id: '3', 
    name: 'Combe Tennis Center', 
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 11:00 PM',
      2: '6:00 AM - 11:00 PM',
      3: '6:00 AM - 11:00 PM',
      4: '6:00 AM - 11:00 PM',
      // Friday 
      5: '6:00 AM - 10:00 PM',
      // Saturday
      6: '8:00 AM - 9:00 PM',
      // Sunday
      7: '8:00 AM - 10:00 PM',
    },
    image: 'assets/images/combe_tennis_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Combe+Tennis+Center/@42.0594618,-87.6726831,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdbbb216116af:0xab594c05089e905d!8m2!3d42.0594618!4d-87.6726831!16s%2Fg%2F11fql28pgk?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=6916457052546306450&ll=42.059856,-87.672699&lsp=9902&q=Combe%20Tennis%20Center',
  ),
  Facility(
    id: '4', 
    name: 'Vandy Christie Tennis Center', 
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 10:00 PM',
      2: '6:00 AM - 10:00 PM',
      3: '6:00 AM - 10:00 PM',
      4: '6:00 AM - 10:00 PM',
      // Friday 
      5: '6:00 AM - 9:00 PM',
      // Saturday
      6: '9:00 AM - 8:00 PM',
      // Sunday
      7: '8:00 AM - 6:00 PM',
    },
    image: 'assets/images/vandy_christie_tennis_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Vandy+Christie+Tennis+Center/@42.050646,-87.672455,18z/data=!4m6!3m5!1s0x880fdb9cdc844af9:0xe4d8d8160a82e1ce!8m2!3d42.0597024!4d-87.6776007!16s%2Fg%2F11fql2clhq?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2310%20Sheridan%20Rd,%20Evanston,%20IL%20%2060201,%20United%20States&auid=17194354996593652242&ll=42.059904,-87.677593&lsp=9902&q=Vandy%20Christie%20Tennis%20Center',
  ),
  Facility(
    id: '5', 
    name: 'Sailing Center', 
    openingHours: {
      // Monday to Friday
      1: '3:00 AM - 7:00 PM',
      2: '3:00 AM - 7:00 PM',
      3: '3:00 AM - 7:00 PM',
      4: '3:00 AM - 7:00 PM',
      5: '3:00 AM - 7:00 PM',
      // Saturday to Sunday
      6: '11:00 AM - 7:00 PM',
      7: '11:00 AM - 7:00 PM',
    },
    image: 'assets/images/sailing_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Northwestern+Sailing+Center/@42.050646,-87.672455,18z/data=!3m1!4b1!4m6!3m5!1s0x880fd076c3fbaa99:0x2aab0da5a783a287!8m2!3d42.050646!4d-87.672455!16s%2Fg%2F1tr7dd73?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=1823%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=3158140491519407967&ll=42.050633,-87.672575&lsp=9902&q=Sailing%20Center',
  ),
  Facility(
    id: '6', 
    name: 'Lincoln Street (North) Beach', 
    openingHours: {
      // Monday to Sunday
      1: '10:30 AM - 8:00 PM',
      2: '10:30 AM - 8:00 PM',
      3: '10:30 AM - 8:00 PM',
      4: '10:30 AM - 8:00 PM',
      5: '10:30 AM - 8:00 PM',
      6: '10:30 AM - 8:00 PM',
      7: '10:30 AM - 8:00 PM',
    },
    image: 'assets/images/lincoln_street_beach_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Northwestern+University+-+Lincoln+St.+Beach/@42.0609901,-87.6756728,16.4z/data=!4m6!3m5!1s0x880fda99623c99df:0xa7705b881f503d30!8m2!3d42.061206!4d-87.6730013!16s%2Fg%2F11c0xqk8dy?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=16562362757212632467&ll=42.060958,-87.672980&lsp=9902&q=Northwestern%20University%20North%20Beach',
  ),
  Facility(
    id: '7', 
    name: 'Floyd Long Field', 
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 10:00 PM',
      2: '6:00 AM - 10:00 PM',
      3: '6:00 AM - 10:00 PM',
      4: '6:00 AM - 10:00 PM',
      // Friday 
      5: '6:00 AM - 9:00 PM',
      // Saturday
      6: '9:00 AM - 8:00 PM',
      // Sunday
      7: '8:00 AM - 6:00 PM',
    },
    image: 'assets/images/floyd_long_field_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Floyd+Long+Field/@42.058665,-87.6717997,17z/data=!4m6!3m5!1s0x880fda9880fb6f15:0x8083a55fd322b6cd!8m2!3d42.0620503!4d-87.6776516!16s%2Fg%2F11cmq_qkk8?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2498%20Sheridan%20Rd,%20Evanston,%20IL%20%2060208,%20United%20States&auid=2458808429074253708&ll=42.062233,-87.678324&lsp=9902&q=Floyd%20Long%20Field',
  ),
  Facility(
    id: '1', 
    name: 'Lakeside Fields', 
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 10:00 PM',
      2: '6:00 AM - 10:00 PM',
      3: '6:00 AM - 10:00 PM',
      4: '6:00 AM - 10:00 PM',
      // Friday 
      5: '6:00 AM - 9:00 PM',
      // Saturday
      6: '9:00 AM - 8:00 PM',
      // Sunday
      7: '8:00 AM - 6:00 PM',
    },
    image: 'assets/images/norris_aquatics_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Lakeside+Field/@42.058665,-87.6717997,17z/data=!3m1!4b1!4m6!3m5!1s0x880fda9c675ec211:0x448216c6f42ecf81!8m2!3d42.058665!4d-87.6717997!16s%2Fg%2F1tg4lz_h?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=910924413803749916&ll=42.058530,-87.671842&lsp=9902&q=Lakeside%20Field',
  ),
  Facility(
    id: '8', 
    name: 'Wellness Suite', 
    openingHours: {
      // Monday to Wednesday
      1: '6:00 AM - 6:00 PM',
      2: '6:00 AM - 6:00 PM',
      3: '6:00 AM - 6:00 PM',
      // Thursday
      4: '6:00 AM - 7:00 PM',
      // Friday 
      5: '6:00 AM - 5:00 PM',
      // Saturday
      6: '9:00 AM - 4:00 PM',
      // Sunday
      7: '8:00 AM - 8:00 AM',
    },
    image: 'assets/images/wellness_suite_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/2311+Campus+Dr,+Evanston,+IL+60208/@42.0594618,-87.6726831,17z/data=!3m1!4b1!4m6!3m5!1s0x880fda99546583b5:0x548f6060a0f133e1!8m2!3d42.0594618!4d-87.6726831!16s%2Fg%2F11c24k_70k?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&ll=42.059359,-87.673779&q=2311%20Campus%20Dr',
  ),
  Facility(
    id: '9', 
    name: 'Clark Street (South) Beach', 
    openingHours: {
      // Monday to Wednesday
      1: '6:00 AM - 6:00 PM',
      2: '6:00 AM - 6:00 PM',
      3: '6:00 AM - 6:00 PM',
      // Thursday
      4: '6:00 AM - 7:00 PM',
      // Friday 
      5: '6:00 AM - 5:00 PM',
      // Saturday
      6: '9:00 AM - 4:00 PM',
      // Sunday
      7: '8:00 AM - 8:00 AM',
    },
    image: 'assets/images/clark_street_beach_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Clark+Street+Beach/@42.0493607,-87.672527,18z/data=!3m1!4b1!4m6!3m5!1s0x880fd073fcd437db:0xf08cfe26630b04ea!8m2!3d42.0493297!4d-87.6727996!16s%2Fg%2F1tklr4c9?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=1811%20Sheridan%20Rd,%20Evanston,%20IL%20%2060201,%20United%20States&auid=8143039327561055280&ll=42.049056,-87.672677&lsp=9902&q=Clark%20Street%20Beach',
  ),
];