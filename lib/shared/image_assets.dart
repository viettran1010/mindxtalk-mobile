class ImageAssets {
  static String getAssetImage(String name) => 'assets/images/$name';

  static final icApp = getAssetImage('background.svg');
  static final icLock = getAssetImage('ic_lock.svg');
  static final icFaceId = getAssetImage('ic_face_id.svg');
}
