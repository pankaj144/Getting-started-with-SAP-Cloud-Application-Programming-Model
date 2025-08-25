sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'pk/booklist/test/integration/FirstJourney',
		'pk/booklist/test/integration/pages/BooksList',
		'pk/booklist/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('pk/booklist') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);