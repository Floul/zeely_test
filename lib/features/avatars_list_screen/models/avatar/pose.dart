/// Enum representing the pose of an avatar.
enum Pose {
  standing('Standing'),
  sitting('Sitting'),
  selfie('Selfie'),
  carSelfie('Car Selfie'),
  walking('Walking');

  final String displayName;

  const Pose(this.displayName);
}
