class ContractModel {
  String name;
  String number;

  ContractModel(
    this.number,
    this.name,
  );
}

List<ContractModel> allContractList = [
  ContractModel('01985864112', 'Abul Barkat'),
  ContractModel('01445864111', 'Abdus Salam'),
  ContractModel('01685854113', 'Nasima Akhtet'),
  ContractModel('01585854114', 'Fazle Hussain'),
  ContractModel('01684854115', 'Salman Khan'),
  ContractModel('01285854116', 'Omar Ishrak'),
  ContractModel('01485854117', 'Lucina Uddin'),
  ContractModel('01485854118', 'Hiralal Sen'),
  ContractModel('01285854119', 'Abdul Hakim'),
  ContractModel('01185854110', 'Jasimuddin'),
];
List<ContractModel> recentList = [
  ContractModel('01445864111', 'Abdus Salam'),
  ContractModel('01684854115', 'Salman Khan'),
  ContractModel('01285854119', 'Abdul Hakim'),
];
