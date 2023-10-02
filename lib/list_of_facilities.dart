import 'facility.dart';

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
  ),
];