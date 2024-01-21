enum ErrorTypes {
  data,
  server,
  secket,
  handshake,
  socket,
  format,
  timeout,
  unknown
}

enum SupportState {
  unknown,
  supported,
  unsupported,
  authenticating,
  authenticated,
  error
}

enum ApiStatus { success, failed }

enum Environment { development, staging, production }

enum AppButtonType { primary, secondary, outline, text }

enum AppState { success, loading, failed, idle }

enum TextFieldType { password, address }

enum TextFiledDecorationType { normal, filled }

enum BottomNavOption { home, chats, poll, profile }

enum MediaType { image, video }

enum CommentAction { reply, update, none }

enum PostAction {
  view,
  profile,
  like,
  comment,
  gift,
  share,
  delete,
  edit,
  save,
  // report,
  block
}

enum PollAction { view, profile, vote, like, gift, comment, edit, delete, upload }

enum CurrencyType { naira, rcoin }

enum FieldType { text, bio, dob, phone, number, gender, custonOption }

enum PostType {
  text,
  image,
  textimage,
  video,
  textvideo,
  textimagevideo,
  imagevideo
}

enum Positions { before, after, leading, extended }

enum CartAction { add, remove }


