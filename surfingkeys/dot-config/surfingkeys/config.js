// an example to create a new mapping `ctrl-y`
api.mapkey("<ctrl-y>", "Show me the money", function () {
	Front.showPopup(
		"a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).",
	);
});

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
api.map("gt", "T");

// for the last fucking time
settings.scrollStepSize = 120;

// go front and back
api.map("J", "S");
api.map("K", "D");

// an example to remove mapkey `Ctrl-i`
api.unmap("<ctrl-i>");

// home-row only hints
api.Hints.setCharacters('asdfghjkleiown')

// Rosé Pine Omnibar Theme for Surfingkeys
// Extracted from the full theme by thuanowa
// Upstream: https://github.com/rose-pine/surfingkeys/blob/main/dist/rose-pine.conf

settings.theme = `
  /* General theme settings that affect the omnibar */
  .sk_theme {
    background: #191724;
    color: #e0def4;
    font-family: "JetBrains Mono NL", "Cascadia Code", "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 12px;
  }
  .sk_theme input {
    color: #e0def4;
  }
  .sk_theme .url {
    color: #c4a7e7;
  }
  .sk_theme .annotation {
    color: #ebbcba;
  }
  .sk_theme kbd {
    background: #26233a;
    color: #e0def4;
  }
  .sk_theme .omnibar_highlight {
    color: #403d52;
  }
  .sk_theme .omnibar_folder {
    color: #e0def4;
  }
  .sk_theme .omnibar_timestamp {
    color: #9ccfd8;
  }
  .sk_theme .omnibar_visitcount {
    color: #9ccfd8;
  }
  .sk_theme .prompt, .sk_theme .resultPage {
    color: #e0def4;
  }
  .sk_theme .separator {
    color: #524f67;
  }

  /* Omnibar container */
  #sk_omnibar {
    overflow: hidden;
    position: fixed;
    width: 80%;
    max-height: 80%;
    left: 10%;
    text-align: left;
    box-shadow: 0px 2px 10px #21202e;
    z-index: 2147483000;
  }
  .sk_omnibar_middle {
    top: 10%;
    border-radius: 4px;
  }
  .sk_omnibar_bottom {
    bottom: 0;
    border-radius: 4px 4px 0px 0px;
  }

  /* Omnibar search area */
  #sk_omnibarSearchArea {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #524f67;
  }
  .sk_omnibar_middle #sk_omnibarSearchArea {
    margin: 0.5rem 1rem;
  }
  .sk_omnibar_bottom #sk_omnibarSearchArea {
    margin: 0.2rem 1rem;
  }
  #sk_omnibarSearchArea .prompt, #sk_omnibarSearchArea .resultPage {
    display: inline-block;
    font-size: 20px;
    width: auto;
  }
  #sk_omnibarSearchArea>input {
    display: inline-block;
    width: 100%;
    flex: 1;
    font-size: 20px;
    margin-bottom: 0;
    padding: 0px 0px 0px 0.5rem;
    background: transparent;
    border-style: none;
    outline: none;
  }

  /* Omnibar search results */
  #sk_omnibarSearchResult {
    max-height: 60vh;
    overflow: hidden;
    margin: 0rem 0.6rem;
  }
  #sk_omnibarSearchResult:empty {
    display: none;
  }
  #sk_omnibarSearchResult>ul {
    padding: 0;
    margin: 0;
  }
  .sk_omnibar_middle #sk_omnibarSearchResult>ul {
    margin-top: 0;
  }
  .sk_omnibar_bottom #sk_omnibarSearchResult>ul {
    margin-bottom: 0;
  }
  #sk_omnibarSearchResult>ul>li {
    padding: 0.2rem 0rem;
    display: block;
    max-height: 600px;
    overflow-x: hidden;
    overflow-y: auto;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li:nth-child(odd) {
    background: #1f1d2e;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li.focused {
    background: #26233a;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li.window {
    border: 2px solid #524f67;
    border-radius: 8px;
    margin: 4px 0px;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li.window.focused {
    border: 2px solid #c4a7e7;
  }

  /* Omnibar result item styling */
  #sk_omnibar span.omnibar_highlight {
    text-shadow: 0 0 0.01em;
  }
  .sk_theme div.table {
    display: table;
  }
  .sk_theme div.table>* {
    vertical-align: middle;
    display: table-cell;
  }
  #sk_omnibarSearchResult li div.title {
    text-align: left;
  }
  #sk_omnibarSearchResult li div.url {
    font-weight: bold;
    white-space: nowrap;
  }
  #sk_omnibarSearchResult li.focused div.url {
    white-space: normal;
  }
  #sk_omnibarSearchResult li span.annotation {
    float: right;
  }
  #sk_omnibarSearchResult .tab_in_window {
    display: inline-block;
    padding: 5px;
    margin: 5px;
    box-shadow: 0px 2px 10px #21202e;
  }

  /* Responsive styles for smaller screens */
  @media only screen and (max-width: 767px) {
    #sk_omnibar {
      width: 100%;
      left: 0;
    }
    #sk_omnibarSearchResult {
      max-height: 50vh;
      overflow: scroll;
    }
    .sk_omnibar_bottom #sk_omnibarSearchArea {
      margin: 0;
      padding: 0.2rem;
    }
  }
`;
