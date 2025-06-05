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
