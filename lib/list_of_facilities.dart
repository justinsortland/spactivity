import 'package:SPACtivity/list_of_dates.dart';

import 'facility.dart';
import 'special_opening_hours.dart';

// Got protein bar image from google images
// Got clark street beach image from: https://www.cityofevanston.org/home/showpublishedimage/15390/637617768863970000
// Got images for ken kraft, sharon drystal, berenice park, and luke donald from nusports.org

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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/protein_bar_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Protein+Bar+%26+Kitchen/@42.0594617,-87.677554,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdb561cd5eb3d:0xd83a6a22b6df80ae!8m2!3d42.0594618!4d-87.6726831!16s%2Fg%2F11rcd8gszx?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%2060208,%20United%20States&auid=11318958517233221556&ll=42.059853,-87.672691&lsp=9902&q=Protein%20Bar%20%26%20Kitchen',
    facilityType: 'food',
    description: [],
    amenities: [],
  ),
  Facility(
    id: '1', 
    name: 'Norris Aquatics Center', 
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 7:00 AM | 8:30 AM - 2:00 PM | 4:00 PM - 10:00 PM',
      2: '6:00 AM - 8:30 AM | 10:30 AM - 2:00 PM | 4:00 PM - 10:00 PM',
      3: '6:00 AM - 2:00 PM | 4:00 PM - 10:00 PM',
      4: '6:00 AM - 8:30 AM | 10:30 AM - 2:00 PM | 4:00 PM - 10:00 PM',
      // Friday 
      5: '6:00 AM - 7:00 AM | 8:30 AM - 2:00 PM | 4:00 PM - 9:00 PM',
      // Saturday
      6: '9:00 AM - 8:00 PM',
      // Sunday
      7: '8:00 AM - 6:00 PM',
    },
    specialOpeningHours: aquaticsSpecialOpeningHours,
    specialDates: aquaticsSpecialDates, 
    image: 'assets/images/norris_aquatics_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Norris+Aquatics+Center/@42.0600471,-87.6734807,17z/data=!3m1!4b1!4m6!3m5!1s0x880fda994fb84527:0x53e48aa61e6edf40!8m2!3d42.0600471!4d-87.6734807!16s%2Fg%2F11r9f2wbf?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=9123114623197736646&ll=42.059273,-87.673765&lsp=9902&q=Norris%20Aquatics%20Center',
    facilityType: 'swimming',
    description: [
    'Located within the Henry Crown Sports Pavilion, the Norris Aquatics Center features a 25 yard x 50 meter pool which is also home to the Northwestern Varsity Swimming and Diving teams.',
    'Water temperature is kept at a cool 80 degrees.',
    'Water depth ranges from 4 feet to 15 feet and includes a hydraulic pool lift.',
    'The aquatics center offers a comprehensive program of instructional, fitness, and recreational activities, including swim lessons, water aerobics, competitive swimming, diving, scuba, lifeguarding and CPR courses.'
    ],
    amenities: [
    '25 yard x 50 meter pool (water temperature is kept at 80 degrees and water depth ranges from 4 feet to 15 feet)',
    '1-meter and 3-meter springboards',
    '3-meter and 5-meter platform',
    '2 locker rooms',
    '1 Family restroom',
    '2 Family changing rooms',
    '2 saunas',
    ],
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/ryan_fieldhouse_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Ryan+Fieldhouse/@42.0594618,-87.6726831,17z/data=!4m6!3m5!1s0x880fdbcfb1554ab3:0x563a04ebfa991cc1!8m2!3d42.060229!4d-87.6725064!16s%2Fg%2F11fcs4s3p4?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2333%20Campus%20Dr,%20Evanston,%20IL%2060208,%20United%20States&auid=3073132621414396731&ll=42.059872,-87.672529&lsp=9902&q=Ryan%20Fieldhouse',
    facilityType: 'training',
    description: [
    'At a massive 96,135 square feet, and designed for a maximum assembly occupancy of 6,000 people.',
    'Ryan Fieldhouse\'s distinctive dome shape is based on football punting and kicking trajectories, with the peak of the dome reaching 87 feet above the turf field.',
    'Maximizing its location on the shores of Lake Michigan, the facility features a 44-foot-tall glass façade providing clear views to the north and east.',
    'The fieldhouse is flanked by Henry Crown Sports Pavilion and the Walter Athletics Center.',
    'Ryan Fieldhouse hosts varsity sport practices and competitions; club and intramural activities; and special events.',
    'Additionally, Wilson Field is striped for NCAA regulation football, soccer and lacrosse and has an automated netting system designed to subdivide the space for use by multiple groups simultaneously.',
    'Enter Ryan Fieldhouse/Wilson Field through the Henry Crown Sports Pavilion (SPAC).',
    ],
    amenities: [],
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/combe_tennis_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Combe+Tennis+Center/@42.0594618,-87.6726831,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdbbb216116af:0xab594c05089e905d!8m2!3d42.0594618!4d-87.6726831!16s%2Fg%2F11fql28pgk?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=6916457052546306450&ll=42.059856,-87.672699&lsp=9902&q=Combe%20Tennis%20Center',
    facilityType: 'tennis',
    description: [
    'Adult and Junior Group and private lessons are open to the public.',
    'For more information, please contact Jennifer Lutgert at j-lutgert@northwestern.edu or visit nutennis.com.',
    ],
    amenities: [
    '6 courts',
    'Spectator seating located on the Henry Crown Sports Pavilion (SPAC) 2nd floor',
    ],
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/vandy_christie_tennis_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Vandy+Christie+Tennis+Center/@42.050646,-87.672455,18z/data=!4m6!3m5!1s0x880fdb9cdc844af9:0xe4d8d8160a82e1ce!8m2!3d42.0597024!4d-87.6776007!16s%2Fg%2F11fql2clhq?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2310%20Sheridan%20Rd,%20Evanston,%20IL%20%2060201,%20United%20States&auid=17194354996593652242&ll=42.059904,-87.677593&lsp=9902&q=Vandy%20Christie%20Tennis%20Center',
    facilityType: 'tennis',
    description: [
    'Courts are available for recreational play on a first-come, first-served basis late spring through fall.',
    'Courts close for the season in late October.',
    ],
    amenities: [
    '15 hard-surface outdoor tennis courts',
    'Courtside water fountains',
    ],
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/sailing_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Northwestern+Sailing+Center/@42.050646,-87.672455,18z/data=!3m1!4b1!4m6!3m5!1s0x880fd076c3fbaa99:0x2aab0da5a783a287!8m2!3d42.050646!4d-87.672455!16s%2Fg%2F1tr7dd73?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=1823%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=3158140491519407967&ll=42.050633,-87.672575&lsp=9902&q=Sailing%20Center',
    facilityType: 'beach',
    description: [
    'Located two blocks east of Sheridan Road and Chicago Avenue, the center is open May to October, weather permitting. NU students, faculty, staff, alumni, other University affiliates, and the general public may enjoy access to the Center.',
    'The Sailing Center maintains a fleet of watercrafts (see in Amenities page).',
    'The Sailing Center may close due to inclement weather, and not all watercrafts are available for general use during classes and regattas. Please call the Sailing Center at 847-491-4142 for information concerning weather related closures and daily boat availability.',
    ],
    amenities: [
    '12 - Laser-class sailboats (Capacity: 2 maximum)',
    '18 - 420-class sailboats main/jib (Capacity: 2 minimum, 3 maximum)',
    '20 - Windsurfing boards with rigs (Capacity: 1 maximum)',
    '4 - Hobie Wave Catamarans (Capacity: 3 maximum)',
    '4 - Hobie Gateway (Capacity: 5 maximum)',
    '18 - Stand-up Paddleboards (Capacity: 1 maximum)',
    '6 - Double Kayaks (Capacity: 2 maximum)',
    '10 - Single Kayaks (Capacity: 1 maximum)',
    ],
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/lincoln_street_beach_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Northwestern+University+-+Lincoln+St.+Beach/@42.0609901,-87.6756728,16.4z/data=!4m6!3m5!1s0x880fda99623c99df:0xa7705b881f503d30!8m2!3d42.061206!4d-87.6730013!16s%2Fg%2F11c0xqk8dy?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=16562362757212632467&ll=42.060958,-87.672980&lsp=9902&q=Northwestern%20University%20North%20Beach',
    facilityType: 'beach',
    description: [
    'Green Flag - swimming area is OPEN',
    'Yellow Flag - swimiming area is OPEN. Use additional caution. Parents or guardians must accompany their children into the water at all times due to waves or currents.',
    'Red Flag - swimming area is CLOSED due to one or more of the following conditions',
    '● Elevated bacteria level',
    '● Unsafe wave action',
    '● Unsafe water currents',
    '● High winds limiting visibility due to blowing sand',
    '● Thunder',
    '● Fog',
    '● Seiche effects (rapid change in water level due to change in barometric pressure)',
    '● The opening of the locks in Wilmette triggers an immediate closing for at least 24 hours',
    '● Other health hazards (biological/chemical waste)',
    'Both the beach and swimming area will be closed due to one or more of the following conditions:',
    '● Outside of operating hours',
    '● No lifeguard on duty',
    '● Lightning',
    '● Heavy rain',
    '● Low temperatures',
    '● Flooded beach area', 
    '● Tornado or tornado warning',
    '● Waterspout',
    ],
    amenities: [],
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/floyd_long_field_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Floyd+Long+Field/@42.058665,-87.6717997,17z/data=!4m6!3m5!1s0x880fda9880fb6f15:0x8083a55fd322b6cd!8m2!3d42.0620503!4d-87.6776516!16s%2Fg%2F11cmq_qkk8?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2498%20Sheridan%20Rd,%20Evanston,%20IL%20%2060208,%20United%20States&auid=2458808429074253708&ll=42.062233,-87.678324&lsp=9902&q=Floyd%20Long%20Field',
    facilityType: 'field',
    description: [
    'These playing fields are used as practice fields for varsity teams as well as competition fields for intramural sports teams and sport clubs.',
    ],
    amenities: [
    '4.75 acres of grass playing fields',
    '3 softball fields (spring, summer)',
    '4 flag football fields (fall) or 4 Ultimate Frisbee fields (spring)'
    ],
  ),
  Facility(
    id: '8', 
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/lakeside_fields_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Lakeside+Field/@42.058665,-87.6717997,17z/data=!3m1!4b1!4m6!3m5!1s0x880fda9c675ec211:0x448216c6f42ecf81!8m2!3d42.058665!4d-87.6717997!16s%2Fg%2F1tg4lz_h?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=910924413803749916&ll=42.058530,-87.671842&lsp=9902&q=Lakeside%20Field',
    facilityType: 'field',
    description: [
    'These playing fields, with outdoor lighting, are home to the varsity soccer and lacrosse teams.',
    'Sport clubs and intramural teams also enjoy use of these fields.',
    ],
    amenities: [
    'Lanny and Sharon Martin Stadium - Varsity Soccer/LacCrosse Field (permanent seating for 2000)',
    'Lakeside Hockey Field - Varsity Field Hockey (permanent seating for 500)',
    'Hutcheson Field - Varsity Football Practice Field',
    ],
  ),
  Facility(
    id: '9', 
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
      7: 'CLOSED',
    },
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/wellness_suite_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/2311+Campus+Dr,+Evanston,+IL+60208/@42.0594618,-87.6726831,17z/data=!3m1!4b1!4m6!3m5!1s0x880fda99546583b5:0x548f6060a0f133e1!8m2!3d42.0594618!4d-87.6726831!16s%2Fg%2F11c24k_70k?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&ll=42.059359,-87.673779&q=2311%20Campus%20Dr',
    facilityType: 'wellness',
    description: [
    'The suite opened with the Henry Crown Sports Pavilion expansion in fall 2014.',
    'It is conveniently located on the first floor, just outside the North Parking Garage elevators.',
    'Contact Nancy Tierney at n-tierney@northwestern.edu or call 847-467-2607 for appointments, consultations, and tours.',
    ],
    amenities: [
    'Fitness Staff Offices',
    'White Light Therapy',
    'Massage Therapy Treatment Rooms',
    'Private Changing Room with Steam Showers',
    ],
  ),
  Facility(
    id: '10', 
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/clark_street_beach_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Clark+Street+Beach/@42.0493607,-87.672527,18z/data=!3m1!4b1!4m6!3m5!1s0x880fd073fcd437db:0xf08cfe26630b04ea!8m2!3d42.0493297!4d-87.6727996!16s%2Fg%2F1tklr4c9?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=1811%20Sheridan%20Rd,%20Evanston,%20IL%20%2060201,%20United%20States&auid=8143039327561055280&ll=42.049056,-87.672677&lsp=9902&q=Clark%20Street%20Beach',
    facilityType: 'beach',
    description: [],
    amenities: [],
  ),
  Facility(
    id: '11', 
    name: 'Patten Gymnasium', 
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/patten_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Patten+Gymnasium,+Evanston,+IL+60208/@42.0542742,-87.6782126,17z/data=!4m6!3m5!1s0x880fda9894cdfdb5:0x9f7d9a59eb1078a7!8m2!3d42.0611042!4d-87.6765978!16s%2Fg%2F1tftfxr_?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2407%20Sheridan%20Rd,%20Evanston,%20IL%20%2060208,%20United%20States&auid=6162683692005864473&ll=42.061234,-87.676606&lsp=9902&q=Patten%20Gymnasium',
    facilityType: 'training',
    description: [
    'Patten Gymnasium is a historic, multi-purpose facility located on Northwestern\'s main campus and is the current home of the women\'s fencing program.',
    'It is one of the best fencing-only facilities in the country.',
    ],
    amenities: [],
  ),
  Facility(
    id: '12', 
    name: 'Ken Kraft Wrestling Room', 
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/ken_kraft_wrestling_room_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Ken+Kraft+Wrestling+Room+Northwestern+University/@42.0665163,-87.6953627,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdb9d3d7e11d7:0xe99ee62a81ae4b62!8m2!3d42.0665123!4d-87.6927878!16s%2Fg%2F11j43nlsk_?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2701%20Ashland%20Ave,%20Evanston,%20IL%20%2060208,%20United%20States&ll=42.066431,-87.691490&q=2701%20Ashland%20Ave',
    facilityType: 'training',
    description: [
    'The Ken Kraft Wrestling Complex is part of the new Anderson Hall renovations.',
    'It contains three 42\' x 42\' mats, almost doubling the former wrestling room size.',
    'It houses coaching offices and locker rooms',
    'According to Ken Kraft himself, "the new facility has a nearby locker room, modern amenities and is among the best in college wrestling."',
    ],
    amenities: [],
  ),
  Facility(
    id: '13', 
    name: 'Sharon J. Drysdale Field', 
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/sharon_drysdale_field_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Sharon+J.+Drysdale+Field,+1501+Central+St,+Evanston,+IL+60201/@42.0665163,-87.6953627,17z/data=!4m6!3m5!1s0x880fdab198e6b5f7:0x624c3dc7c318c56b!8m2!3d42.0669442!4d-87.6915476!16s%2Fg%2F11bvtcns5q?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=1501%20Central%20St,%20Evanston,%20IL%20%2060208,%20United%20States&auid=10146591978227468195&ll=42.066969,-87.691530&lsp=9902&q=Sharon%20J.%20Drysdale%20Field',
    facilityType: 'baseball',
    description: [
    'Sharon J. Drysdale Field, home to Northwestern Softball since the early days of legendary coach and field namesake Sharon J. Drysdale\'s tenure, is the Wildcats own little Wrigley Field on the North Shore.',
    'With ivy growing plentiful on the walls of adjacent McGaw Hall and spectator seating close to the action, gameday at "The J" is fun for all ages.',
    ],
    amenities: [],
  ),
  Facility(
    id: '14', 
    name: 'Rocky and Berenice Millar Park', 
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/rocky_and_berenice_millar_park_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Rocky+Miller+Park/@42.0680511,-87.6950929,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdab179b3980b:0x6e8dcf72649fe2d0!8m2!3d42.0680471!4d-87.692518!16s%2Fm%2F027509m?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2751%20Ashland%20Ave,%20Evanston,%20IL%2060208,%20United%20States&auid=8417289865821247211&ll=42.068028,-87.692614&lsp=9902&q=Rocky%20and%20Berenice%20Miller%20Park',
    facilityType: 'baseball',
    description: [],
    amenities: [],
  ),
  Facility(
    id: '15', 
    name: 'Luke Donald Practice Facility and The Gleacher Center', 
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/luke_donald_practice_facility_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Luke+Donald+Practice+Facility+and+The+Gleacher+Center/@42.0611092,-87.6791737,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdbfc68a69083:0x24a7137b4030c866!8m2!3d42.0611052!4d-87.6765988!16s%2Fg%2F11j4dsp_pm?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2407%20Sheridan%20Rd,%20Evanston,%20IL%20%2060208,%20United%20States&ll=42.061295,-87.676759&q=2407%20Sheridan%20Rd',
    facilityType: 'golf',
    description: [
    'The Luke Donald Outdoor Practice Facility includes a 15,000-square foot bent grass range tee, a 1/2-acre practice pitching/chipping area with a 6,000-square foot usga green, bent grass, bluegrass and fescue turfed areas for a variety of lies and shots.',
    'There are also three practice bunkers, totaling 5,000-square feet for shots of varying length into the chipping green.',
    'A 3,000-square foot practice putting green is also part of the facility as well as a fairway bunker practice shot area.',
    ],
    amenities: [],
  ),
  Facility(
    id: '16', 
    name: 'Trienens Performance Center', 
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
    specialOpeningHours: {},
    specialDates: [], 
    image: 'assets/images/trienens_performance_center_image.png',
    googleMapsUrl: 'https://www.google.com/maps/place/Trienens+Hall,+2707+Ashland+Ave,+Evanston,+IL+60201/@42.0672439,-87.6958727,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdab232905ec9:0x646e8713fbf88585!8m2!3d42.0672439!4d-87.6932978!16s%2Fg%2F1td2hhxd?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2707%20Ashland%20Ave,%20Evanston,%20IL%20%2060208,%20United%20States&auid=4780377044409302992&ll=42.066969,-87.693332&lsp=9902&q=Trienens%20Performance%20Center',
    facilityType: 'basketball',
    description: [
    'The Trienens Performance Center features a fieldhouse with three practice courts, adjacent to Welsh-Ryan Arena. It also includes:',
    '● Best-in-class athletic training and rehabilitation amenities',
    '● Ultramodern strength and conditioning facilities',
    '● Team meeting rooms with advanced teaching technologies',
    '● Expanded performance nutrition hub',
    '● Offices for men’s and women’s basketball',
    '● Staff locker rooms',
    'Additionally, Katz Field and Mogentale Training Facility, which are used for training for Northwestern\'s baseball and softball\'s programs, are housed inside of Trienens Performance Center.',
    'The indoor space has hosted wrestling competitions as well. ',
    ],
    amenities: [],
  ),
];