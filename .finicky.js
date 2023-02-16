const WORK_APPS = ['Code', 'Discord', 'GitHub Desktop', 'iTerm2', 'Slack', 'zoom.us'];

module.exports = {
  defaultBrowser: 'Safari',
  options: {
    hideIcon: true,
    checkForUpdate: true,
  },
  handlers: [
    // open links from work apps in Chrome (except twitter links)
    {
      match: ({ opener, url, keys }) => {
        return WORK_APPS.includes(opener.name) && url.host !== 'twitter.com' && !finicky.getKeys().option;
      },
      browser: 'Google Chrome',
    },
  ],
};
