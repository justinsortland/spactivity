import 'gym.dart';
import 'equipment.dart';
import 'list_of_equipment.dart';
import 'list_of_dates.dart';
import 'special_opening_hours.dart';

// Got willard image from willardnu.com on google images
// Got patten image from wikipedia
// Got 1838 chicago image from: https://www.google.com/url?sa=i&url=https%3A%2F%2Fnustudentaffairs.smugmug.com%2FNorthwestern-Residences%2F1838-Chicago&psig=AOvVaw1Ez7rPNtNncqSn4wnmhcxf&ust=1698350597879000&source=images&cd=vfe&opi=89978449&ved=0CBIQjhxqFwoTCKCAgpP_kYIDFQAAAAAdAAAAABAI
// Got walter athletics image from: https://walshwebsiteassets.blob.core.windows.net/sitedocs/imagegallery/news/Ryan_Fieldhouse_Walsh_ABI_006-(low).jpg

final List<Gym> ListOfGyms = [
  Gym(
    id: '0',
    name: 'Henry Crown Sports Pavilion (SPAC)',

    // Normal hours for Fall, Winter, and Spring quarters
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
    specialOpeningHours: SPACSpecialOpeningHours,
    specialDates: SPACSpecialDates,
    image: 'assets/images/spac_image.png',
    requiresKeycard: false,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions, pushPull: [], legsBackChest: []),
      Equipment(id: '1', name: '10 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: [], pushPull: [], legsBackChest: []),  
      Equipment(id: '2', name: '15 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: [], pushPull: [], legsBackChest: []),  
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/Henry+Crown+Sports+Pavilion/@42.0596373,-87.6729806,17z/data=!3m1!4b1!4m6!3m5!1s0x880fd00b703e4c39:0x509c3569d8eb2a8e!8m2!3d42.0596373!4d-87.6729806!16s%2Fg%2F1hf3_crv1?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=3095236694710247902&ll=42.059497,-87.673409&lsp=9902&q=Henry%20Crown%20Sports%20Pavilion',
    hasSwipeIn: true,
    description: [
    'This 95,000-square-foot facility is linked to the Norris Aquatics Center, the Combe Tennis Center, and the Ryan Fieldhouse.',
    'Basketball, swimming, squash, racquetball, tennis, group exercise, cycling, weight lifting, and general cardio and exercise-related activities are available.',
    ],
    amenities: [
    '7,000 sq. ft. Fitness Center (1st floor)',
    'Three Basketball Courts',
    'One Multi-Purpose Court (MAC Court)',
    'Three Lane Jogging / Walking Track',
    'Group Training Room',
    'Dedicated Cycle Room',
    'Three Multi-Purpose Fitness Studios',
    'Cardiovascular Room (2nd floor)',
    'Two Racquetball Courts',
    'Three Squash Courts',
    'Stretching Room',
    'Indoor Lounge Areas',
    'Locker Rooms with Showers and Saunas',
    'Family Restroom and Changing Room',
    'Pro Shop',
    'Wellness Suite / Massage Therapy',
    ],
  ),
  Gym(
    id: '1',
    name: 'Blomquist Recreation Center',
    openingHours: {
      // Monday to Friday
      1: '7:00 AM - 11:00 PM',
      2: '7:00 AM - 11:00 PM',
      3: '7:00 AM - 11:00 PM', 
      4: '7:00 AM - 11:00 PM',
      5: '7:00 AM - 8:00 PM',
      // Saturday and Sunday
      6: '8:00 AM - 7:00 PM',
      7: '8:00 AM - 10:00 PM',
    },
    specialOpeningHours: blomSpecialOpeningHours,
    specialDates: blomSpecialDates,
    image: 'assets/images/blomquist_image.png',
    requiresKeycard: false,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions, pushPull: [], legsBackChest: []),
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/Blomquist+Recreation+Center/@42.0596373,-87.6729806,17z/data=!4m6!3m5!1s0x880fd00aaef54689:0x5b45adac0ce7b8dd!8m2!3d42.0542742!4d-87.6782126!16s%2Fg%2F11r8lyfxt?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=617%20Foster%20St,%20Evanston,%20IL%2060208,%20United%20States&auid=6376848072959538694&ll=42.054236,-87.678205&lsp=9902&q=Blomquist%20Recreation%20Center',
    hasSwipeIn: true,
    description: [],
    amenities: [
    '1 2,500-square-foot strength-training area',
    '2 hardwood multipurpose courts (marked for basketball, badminton, and volleyball)',
    '2 locker rooms with showers',
    'lock checkout',
    ],
  ),
  Gym(
    id: '2',
    name: '1838 Chicago Residential Hall',
    openingHours: {
      // Monday to Thursday
      1: 'Open 24 Hours',
      2: 'Open 24 Hours',
      3: 'Open 24 Hours', 
      4: 'Open 24 HoursM',
      // Friday
      5: 'Open 24 Hours',
      // Saturday
      6: 'Open 24 Hours',
      // Sunday
      7: 'Open 24 Hours',
    },
    specialOpeningHours: {},
    specialDates: [],
    image: 'assets/images/1838_chicago_image.png',
    requiresKeycard: true,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions, pushPull: [], legsBackChest: []),
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/1838+Chicago+Ave,+Evanston,+IL+60201/@42.0511898,-87.6787722,18.26z/data=!4m6!3m5!1s0x880fd00b4a1fda1b:0x5b118bbbb0885fc1!8m2!3d42.0509935!4d-87.6781446!16s%2Fg%2F11c226h05w?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=1838%20Chicago%20Ave,%20Evanston,%20IL%20%2060201,%20United%20States&ll=42.050959,-87.677982&q=1838%20Chicago%20Ave',
    hasSwipeIn: false,
    description: [],
    amenities: [],
  ),
  Gym(
    id: '3',
    name: 'Willard Residential Hall',
    openingHours: {
      // Monday to Thursday
      1: 'Open 24 Hours',
      2: 'Open 24 Hours',
      3: 'Open 24 Hours', 
      4: 'Open 24 Hours',
      // Friday
      5: 'Open 24 Hours',
      // Saturday
      6: 'Open 24 Hours',
      // Sunday
      7: 'Open 24 Hours',
    },
    specialOpeningHours: {},
    specialDates: [],
    image: 'assets/images/willard_image.png',
    requiresKeycard: true,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions, pushPull: [], legsBackChest: []),
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/Willard+Residential+College/@42.0511898,-87.6787722,18.26z/data=!4m6!3m5!1s0x880fda9f4e67066f:0x8a91a058d45f90de!8m2!3d42.0516675!4d-87.6811432!16s%2Fg%2F1tgpt6f0?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=Northwestern%20University,%201865%20Sherman%20Ave,%20Evanston,%20IL%20%2060201,%20United%20States&auid=7921959845694685636&ll=42.051671,-87.681477&lsp=9902&q=Willard%20Residential%20College',
    hasSwipeIn: false,
    description: [],
    amenities: [],
  ),
  Gym(
    id: '4',
    name: 'Walter Athletics Center',
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
    image: 'assets/images/walter_athletics_center_image.png',
    requiresKeycard: true,
    equipmentList: [],
    googleMapsUrl: 'https://www.google.com/maps/place/Walter+Athletics+Center/@42.0592334,-87.6719085,17z/data=!3m1!4b1!4m6!3m5!1s0x880fdbddcff93f59:0x84c823e011cfa67f!8m2!3d42.0592334!4d-87.6719085!16s%2Fg%2F11f9hb5q3k?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2255%20Campus%20Drive,%20Evanston,%20IL%2060208,%20United%20States&auid=5372156225395317761&ll=42.059999,-87.672486&lsp=9902&q=Walter%20Athletics%20Center',
    hasSwipeIn: true,
    description: [],
    amenities: [],
  ),
];