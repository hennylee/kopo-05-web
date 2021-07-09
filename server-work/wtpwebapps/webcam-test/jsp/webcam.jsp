<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  </title>
  <meta name="description" content="WebRTC에 대한 정보 공유" />
  <meta name="author" content="codeJS" />
  <meta name="viewport" content="width=1024, initial-scale=1.0" />

  <link href="/img/logo-webrtc.png" type="image/png" rel="icon" />
  <link href="/css/style.css" type="text/css" rel="stylesheet" />
  <link href="/css/github-gist.css" type="text/css" rel="stylesheet" />
  <script src="/js/lib/jquery.js"></script>
  <script src="/js/lib/DetectRTC.js"></script>
  <script src="/js/helpers/object.js"></script>
  <script type="text/javascript">
  /**
   * getUserMedia 성공
   * @param stream
   */
  function success(stream) {
    console.log('onSuccess', arguments);
    const $video = document.querySelector('video');

    // For IOS safari (https://github.com/webrtc/samples/issues/929)
    if (DetectRTC.browser.isSafari) {
      $video.setAttribute('playsinline', true);
      $video.setAttribute('controls', true);

      setInterval(function () {
        $video.removeAttribute('controls');
      }, 0);
    }

    // video 테그에 stream 바인딩
    $video.srcObject = stream;
  }

  /**
   * getUserMedia 실패
   * @param error
   */
  function error(err) {
    console.log('error', err);
    alert(err.message);
  }

  /**
   * 미디어 호출
   */
  async function startMedia() {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({
        audio: true,
        video: true,
      });
      success(stream);
    } catch (err) {
      error(err);
    }
  }

  /**
   * 버튼 이벤트 바인딩
   */
  document.querySelector('button').addEventListener('click', startMedia);
  
  </script>
</head>

<body>
  
<div id="content">
    <div class="wrap">
      <video autoplay></video>
      <button>getUserMedia()</button>

      <pre>
   	</pre>
    </div>
  </div>

<script src="/js/lib/highlight.min.js"></script>
<script src="/js/base.js" type="module"></script>
</body>

</html>
