<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', '/var/log/php_errors.log');

session_start();
include_once(__DIR__."/../inc/head.inc");
$is_exist = 0;
if (isset($_SESSION['user_ac_key'])) {
    $ac_key = $_SESSION['user_ac_key'];
    $rst = mysql_query("SELECT * FROM user WHERE user_ac_key = '$ac_key'");
    if ($rst->num_rows > 0) {
        $usr = mysqli_fetch_assoc($rst);
        $is_exist = 1;
    }
}

$is_request = $_POST['request'] ?? 0;

if (isset($_POST['request'])) {
    $name = isset($_POST['figure_name']) ? mysqli_real_escape_string($con, $_POST['figure_name']) : '';
    $anime = isset($_POST['anime_name']) ? mysqli_real_escape_string($con, $_POST['anime_name']) : '';
    $maker = isset($_POST['maker_name']) ? mysqli_real_escape_string($con, $_POST['maker_name']) : '';
    $memo = isset($_POST['memo']) ? mysqli_real_escape_string($con, $_POST['memo']) : '';    
    mysql_query("INSERT INTO figure_request (name,anime,maker,memo) VALUES ('$name','$anime','$maker','$memo')");
}

?>
<!-- 左側のメニュー -->
<div class="sidebar" id="sidebar">
    <h2>メニュー</h2>
    <!-- ハンバーガーメニューボタン -->
    <div class="menu-icon" id="menu-icon">
    ☰
    </div>
    <ul>
        <li><a href="<?=$_ENV['URL_USER_INDEX']?>">フィギュア一覧</a></li>
        <?php if ($is_exist === 0) { ?>
        <li><a href="<?=$_ENV['URL_USER_LOGIN']?>">ログイン</a></li>
        <?php } else if ($is_exist === 1) { ?>
        <li><a href="<?=$_ENV['URL_USER_FAVORITE']?>">お気に入り一覧</a></li>
        <li><a href="<?=$_ENV['URL_USER_LOGIN']?>">ログアウト</a></li>
        <?php } ?>
    </ul>
</div>

<div class="content" id="content">
        <h1 id="top">リクエスト</h1>
        <?php if ($is_exist == 1) { ?>
            <p style="color: green; font-size: 17px;">ログインユーザです。</p>
        <?php } else { ?>
            <p style="color: green; font-size: 17px;">ゲストユーザです。</p>
        <?php } ?>
        <p style="display: <?php echo( $is_request == 1 ? 'block':'none');?>; color:darkcyan">
            *リクエストが送信されました。
        </p>
        <?php $is_request = 0; ?>

            <form action='' method="POST">
            <table>
                <tr>
                    <th>アニメ名</th>
                    <td><input type="text" name="anime_name" class="search-input"></td>
                </tr>
                <tr>
                    <th>フィギュア名</th>
                    <td><input type="text" name="figure_name" class="search-input" required></td>
                </tr>
                <tr>
                    <th>メーカー</th>
                    <td><input type="text" name="maker_name" class="search-input"></td>
                </tr>
                <tr>
                    <th>詳細(例: 秋ごろに出た暁のサスケのフィギュア)</th>
                    <td><input type="text" id="memo" name="memo"></td>
                </tr>
            </table>
            <input type="hidden" name="request" value="1">
            <button type="submit" class="search-button">リクエスト</button>
        </form>
        </div>

<script>
    const sidebar = document.getElementById('sidebar');
    const menu_bar = document.getElementById('menu-icon');
    const content = document.getElementById('content');
    const figure_form_show = document.getElementById('search_condition');
    const figure_form = document.getElementById('figure_form');

    // マウスがトリガーに乗ったときにサイドバーを表示
    menu_bar.addEventListener('mouseover', () => {
        sidebar.classList.add('visible');
        content.classList.add('show');
        menu_bar.classList.add('show');
    });

    // サイドバーからマウスが離れたら非表示にする
    sidebar.addEventListener('mouseleave', () => {
        sidebar.classList.remove('visible');
        content.classList.remove('show');
        menu_bar.classList.remove('show');
    });

    figure_form_show.addEventListener('click',() => {
        figure_form.classList.toggle('show');
    });

    // スクロール位置をローカルストレージに保存
    function saveScrollPosition() {
        localStorage.setItem('scrollPosition', window.scrollY);
    }

    // ページ読み込み時に保存した位置に戻る
    window.onload = function() {
        const scrollPosition = localStorage.getItem('scrollPosition');
        if (scrollPosition) {
            window.scrollTo(0, scrollPosition);
            localStorage.removeItem('scrollPosition'); // 一度使ったら削除
        }
    };

</script>

<?php include_once(__DIR__. "/../inc/foot.inc");?>