class BioData {
  String? firstName;
  String? lastName;
  String? gender;
  String? dateOfBirth;
  String? profileImage;

  BioData(
      {this.firstName,
      this.lastName,
      this.gender,
      this.dateOfBirth,
      this.profileImage});

  BioData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
