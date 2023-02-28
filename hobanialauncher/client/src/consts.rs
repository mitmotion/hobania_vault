pub const SUPPORTED_SERVER_API_VERSION: u32 = 1;

// Filesystem

#[cfg(windows)]
pub const DOWNLOAD_FILE: &str = "hobaina.zip";
#[cfg(unix)]
pub const DOWNLOAD_FILE: &str = "hobania";

#[cfg(windows)]
pub const VOXYGEN_FILE: &str = "hobania-voxygen.exe";
#[cfg(unix)]
pub const VOXYGEN_FILE: &str = "hobania-voxygen";

#[cfg(windows)]
pub const LOGS_DIR: &str = "userdata\\voxygen\\logs";

#[cfg(unix)]
pub const LOGS_DIR: &str = "userdata/voxygen/logs";

//#[cfg(windows)]
//pub const SERVER_CLI_FILE: &str = "hobania-server-cli.exe";
#[cfg(unix)]
pub const SERVER_CLI_FILE: &str = "hobania-server-cli";

pub const SAVED_STATE_FILE: &str = "hobanialauncher_state.ron";
pub const LOG_FILE: &str = "hobanialauncher.log";

// Networking

// For querying
pub const CHANGELOG_URL: &str =
    "https://gitlab.com/hobania/hobania/raw/{tag}/CHANGELOG.md";
// For user linking
pub const NEWS_URL: &str = "https://hobania.mitmotion.co.za/rss.xml";

pub const COMMUNITY_SHOWCASE_URL: &str = "https://hobania.mitmotion.co.za/community-showcase/rss.xml";

pub const GITLAB_MERGED_MR_URL: &str =
    "https://gitlab.com/hobania/hobania/-/merge_requests?scope=all&sort=merged_at_desc&state=merged";

pub const AIRSHIPPER_RELEASE_URL: &str = "https://github.com/hobania/Airshipper/releases";

pub const OFFICIAL_AUTH_SERVER: &str = "https://auth.hobania.mitmotion.co.za";

pub const OFFICIAL_SERVER_LIST: &str = "https://serverlist.hobania.mitmotion.co.za";

pub const GITLAB_SERVER_BROWSER_URL: &str =
    "https://gitlab.com/hobania/serverbrowser#hobania-server-browser";
