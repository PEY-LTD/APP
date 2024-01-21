import '../resources/enum.dart';

PostType decodePostType(String value) {
  switch (value.toLowerCase()) {
    case 'text':
      return PostType.text;
    case 'image':
      return PostType.image;
    case 'video':
      return PostType.video;
    case 'text_image':
      return PostType.textimage;
    case 'text_video':
      return PostType.textvideo;
    case 'text_image_video':
      return PostType.textvideo;
    default:
      return PostType.text;
  }
}

String encodeMediaType(PostType type) {
  switch (type) {
    case PostType.image:
      return 'IMAGE';
    case PostType.video:
      return 'VIDEO';
    case PostType.text:
      return 'TEXT';
    case PostType.textimage:
      return 'TEXT_IMAGE';
    case PostType.textvideo:
      return 'TEXT_VIDEO';
    case PostType.textimagevideo:
      return 'TEXT_IMAGE_VIDEO';
    case PostType.imagevideo:
      return 'IMAGE_VIDEO';
  }
}

MediaType decodeMediaType(String value) {
  switch (value.toLowerCase()) {
    case 'video':
      return MediaType.video;

    case 'image':
    default:
      return MediaType.image;
  }
}
