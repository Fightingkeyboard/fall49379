pragma solidity >=0.7.0 <0.8.0;
import "remix_accounts.sol";
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../ReviewScam.sol";

contract ScamTest is GameReviews{

    address acc0;

    function beforeAll() public {
        acc0 = TestsAccounts.getAccount(0);
    }

    function TestOwner() public {
        Assert.equal(getOwner(), acc0, "Owner is different");
        Assert.equal(getOwner(), msg.sender, "Owner is different");
    }

    function TestAward() public {
        Assert.equal(CheckGOTY(), "No game awarded yet", "GOTY wrong");
        Assert.equal(AwardGOTY(1), "Insufficient ether", "GOTY wrong no ether");
        Assert.equal(AwardGOTY(5), "Try again, wrong index", "GOTY wrong no ether");
        GameOfTheYear = 1;
        Assert.equal(CheckGOTY(), "Project Wingman", "GOTY wrong");
    }

    function Initial() public {
        Assert.equal(GameNames[0], "Ace Combat 8", "Wrong Game Names");
        Assert.equal(GameNames[1], "Project Wingman", "Wrong Game Names");
        Assert.equal(GameNames[2], "HAWX", "Wrong Game Names");
        Assert.equal(GameRatings[0], 1, "Wrong Game Ratings");
        Assert.equal(GameRatings[1], 5, "Wrong Game Ratings");
        Assert.equal(GameRatings[2], 0, "Wrong Game Ratings");
        Assert.equal(Reviews[0], "Ok game", "Wrong Game Reviews");
        Assert.equal(Reviews[1], "Great game!", "Wrong Game Reviews");
        Assert.equal(Reviews[2], "Old game", "Wrong Game Reviews");
        Assert.equal(ReviewRating[0], 1, "Wrong Review Rating");
        Assert.equal(ReviewRating[1], 5, "Wrong Review Rating");
        Assert.equal(ReviewRating[2], 0, "Wrong Review Rating");
    }

    function EditReviews() public {
        EditReview(0, "Terrible Game", 2);
        Assert.equal(Reviews[0], "Terrible Game", "Did not edit review");
        Assert.equal(ReviewRating[0], 2, "Wrong Review Rating");
        EditReview(0, "meh", 0);
        Assert.equal(Reviews[0], "meh", "Did not edit review");
        Assert.equal(ReviewRating[0], 0, "Wrong Review Rating");
    }

    function ReviewSubmission() public {
        SubmitReview(1, "Best Game Ever");
        Assert.equal(Reviews[1], "Great game!", "Wrong Game Reviews");
    }
}
// contract FundingTest {
//   function testSettingAnOwnerDuringCreation() public {
//     Funding funding = new Funding();
//     Assert.equal(funding.owner(), this, "An owner is different than a deployer");
//   }
// }
// contract BallotTest {

//     bytes32[] proposalNames;

//     Ballot ballotToTest;
//     function beforeAll () public {
//         proposalNames.push(bytes32("candidate1"));
//         ballotToTest = new Ballot(proposalNames);
//     }

//     function checkWinningProposal () public {
//         ballotToTest.vote(0);
//         Assert.equal(ballotToTest.winningProposal(), uint(0), "proposal at index 0 should be the winning proposal");
//         Assert.equal(ballotToTest.winnerName(), bytes32("candidate1"), "candidate1 should be the winner name");
//     }

//     function checkWinninProposalWithReturnValue () public view returns (bool) {
//         return ballotToTest.winningProposal() == 0;
//     }
// }
