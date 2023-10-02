import 'gym.dart';
import 'equipment.dart';
import 'list_of_equipment.dart';

final List<Gym> ListOfGyms = [
  Gym(
    id: '0',
    name: 'Henry Crown Sports Pavilion (SPAC)',
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
    image: 'assets/images/spac_image.png',
    requiresKeycard: false,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions,),
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/Henry+Crown+Sports+Pavilion/@42.0596373,-87.6729806,17z/data=!3m1!4b1!4m6!3m5!1s0x880fd00b703e4c39:0x509c3569d8eb2a8e!8m2!3d42.0596373!4d-87.6729806!16s%2Fg%2F1hf3_crv1?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2311%20Campus%20Dr,%20Evanston,%20IL%20%2060208,%20United%20States&auid=3095236694710247902&ll=42.059497,-87.673409&lsp=9902&q=Henry%20Crown%20Sports%20Pavilion',
  ),
  Gym(
    id: '1',
    name: 'Blomquist Recreation Center',
    openingHours: {
      // Monday to Friday
      1: '6:00 AM - 9:00 PM',
      2: '6:00 AM - 9:00 PM',
      3: '6:00 AM - 9:00 PM', 
      4: '6:00 AM - 9:00 PM',
      5: '6:00 AM - 9:00 PM',
      // Saturday and Sunday
      6: '8:00 AM - 6:00 PM',
      7: '8:00 AM - 10:00 PM',
    },
    image: 'assets/images/blomquist_image.png',
    requiresKeycard: false,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions,),
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/Blomquist+Recreation+Center/@42.0596373,-87.6729806,17z/data=!4m6!3m5!1s0x880fd00aaef54689:0x5b45adac0ce7b8dd!8m2!3d42.0542742!4d-87.6782126!16s%2Fg%2F11r8lyfxt?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=617%20Foster%20St,%20Evanston,%20IL%2060208,%20United%20States&auid=6376848072959538694&ll=42.054236,-87.678205&lsp=9902&q=Blomquist%20Recreation%20Center',
  ),
  Gym(
    id: '2',
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
    image: 'assets/images/patten_image.png',
    requiresKeycard: false,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions,),
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/Patten+Gymnasium,+Evanston,+IL+60208/@42.0542742,-87.6782126,17z/data=!4m6!3m5!1s0x880fda9894cdfdb5:0x9f7d9a59eb1078a7!8m2!3d42.0611042!4d-87.6765978!16s%2Fg%2F1tftfxr_?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=2407%20Sheridan%20Rd,%20Evanston,%20IL%20%2060208,%20United%20States&auid=6162683692005864473&ll=42.061234,-87.676606&lsp=9902&q=Patten%20Gymnasium',
  ),
  Gym(
    id: '3',
    name: '1838 Chicago Residential Hall',
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
    image: 'assets/images/1838_chicago_image.png',
    requiresKeycard: true,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions,),
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/1838+Chicago+Ave,+Evanston,+IL+60201/@42.0511898,-87.6787722,18.26z/data=!4m6!3m5!1s0x880fd00b4a1fda1b:0x5b118bbbb0885fc1!8m2!3d42.0509935!4d-87.6781446!16s%2Fg%2F11c226h05w?entry=ttu',
    appleMapsUrl: 'https://maps.apple.com/?address=1838%20Chicago%20Ave,%20Evanston,%20IL%20%2060201,%20United%20States&ll=42.050959,-87.677982&q=1838%20Chicago%20Ave',
  ),
  Gym(
    id: '4',
    name: 'Willard Residential Hall',
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
    image: 'assets/images/willard_image.png',
    requiresKeycard: true,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0'], isMachine: false, instructions: ListOfEquipment[0].instructions,),
    ],
    googleMapsUrl: 'https://www.google.com/maps/place/Willard+Residential+College/@42.0511898,-87.6787722,18.26z/data=!4m6!3m5!1s0x880fda9f4e67066f:0x8a91a058d45f90de!8m2!3d42.0516675!4d-87.6811432!16s%2Fg%2F1tgpt6f0?entry=ttu',
    appleMapsUrl: '',
  ),
];