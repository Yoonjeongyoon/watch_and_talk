// YouTube API 스크립트 동적 로드
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// YouTube 플레이어 객체
var player;

// YouTube API 초기화 함수
function onYouTubeIframeAPIReady() {
    player = new YT.Player('player', {
        height: '151',
        width: '260',
        videoId: 'M7lc1UVf-VE',
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
}

// YouTube 플레이어 준비 완료 시 호출되는 함수
function onPlayerReady(event) {
    // 동영상이 준비되었지만 자동 재생은 하지 않음
}

// YouTube 플레이어 상태 변경 시 호출되는 함수
var done = false;

function onPlayerStateChange(event) {
    if (event.data === YT.PlayerState.PLAYING && !done) {
        // 동영상이 재생되고 있을 때, 6초 후에 정지
        setTimeout(stopVideo, 6000);
        done = true;
    }
}

// YouTube 플레이어 정지 함수
function stopVideo() {
    player.stopVideo();
}

// 이미지 클릭 시 동영상 재생 함수
function playVideo() {
    // 이미지 숨기고 동영상 플레이어 보이기
    document.getElementById('thumbnail').style.display = 'none';
    document.getElementById('player').style.display = 'block';

    // 동영상 재생
    player.playVideo();
}
