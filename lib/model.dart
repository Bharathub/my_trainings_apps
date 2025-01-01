class TrainingSession {
  String trainingName;
  String trainer;
  String location;
  String? locationShortDist;

  TrainingSession({
    required this.trainingName,
    required this.trainer,
    required this.location,
    this.locationShortDist,
  });

  @override
  String toString() {
    return trainingName;
  }
}

final List<TrainingSession> sessions = [
  TrainingSession(
    trainingName: "Flutter Basics",
    trainer: "Jane Smith",
    location: "San Francisco, CA",
    locationShortDist: "10 miles",
  ),
  TrainingSession(
    trainingName: "Dart Programming",
    trainer: "John Doe",
    location: "Los Angeles, CA",
    locationShortDist: "50 miles",
  ),
  TrainingSession(
    trainingName: "Advanced Flutter",
    trainer: "Alice Brown",
    location: "New York, NY",
    locationShortDist: "5 miles",
  ),
  TrainingSession(
    trainingName: "UI/UX Design for Mobile Apps",
    trainer: "Bob Johnson",
    location: "Chicago, IL",
    locationShortDist: "20 miles",
  ),
  TrainingSession(
    trainingName: "Backend Development with Node.js",
    trainer: "Charlie Williams",
    location: "Austin, TX",
    locationShortDist: "30 miles",
  ),
  TrainingSession(
    trainingName: "Flutter Basics",
    trainer: "Smith",
    location: "Francisco, C",
    locationShortDist: "10 miles",
  ),
  TrainingSession(
    trainingName: "Flutter Basics",
    trainer: "Jane",
    location: "San, CAS",
    locationShortDist: "10 miles",
  ),
];
