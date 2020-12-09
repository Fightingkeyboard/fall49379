pragma solidity >=0.7.0 <0.8.0;

// designed as a parody of clickbait review sites, pay to review
contract GameReviews {

    // If somebody pays me enough, I shall give them the game of the year award
    uint GameOfTheYear = 999;

    // starting games and reviews
    string[3] public GameNames = ["Ace Combat 8", "Project Wingman", "HAWX"];
    uint[3] public GameRatings = [1, 5, 0];
    string[3] public Reviews = ["Ok game", "Great game!", "Old game"];
    uint[3] public ReviewRating = [1, 5, 0];

    // function to submit review for game, will replace best review if paid enough
    function SubmitReview(uint g, string memory text) public payable returns(string memory){

        if (msg.value > ReviewRating[g]){
            Reviews[g] = text;
            GameRatings[g] += msg.value;
            ReviewRating[g] = msg.value;
            return "Thanks! Your review has been accepted, and replaced the previous one.";
        }

        GameRatings[g] += msg.value;
        return "Thanks! Your review has been accepted.";

    }

    // used for bribing me for Game of the Year award
    function AwardGOTY(uint g) public payable returns (string memory){
        if (g > 3){
            return "Try again, wrong index";
        }
        if (msg.value >= 1000000000000000000){
            if (GameOfTheYear != 999){
                return "Game of the Year has already been awarded. Sorry.";
            }
            GameOfTheYear = g;
            return "Game of the Year awarded";
        }
        if (msg.value < 1000000000000000000){
            return "Insufficient ether";
        }
        return "edge case error";
    }

    //check if game of the year has been awarded
    function CheckGOTY() public view returns (string memory){
        if (GameOfTheYear == 999){
            return "No game awarded yet";
        }
        return GameNames[GameOfTheYear];
    }

    // used to edit reviews
    function EditReview(uint g, string memory text, uint v) public isOwner {

        Reviews[g] = text;
        ReviewRating[g] = v;
        GameRatings[g] += v;

    }

    // Me, in theory
    address payable private owner;

    constructor() payable{

        owner = msg.sender;

    }

    // Who am I?
    function getOwner() public view returns(address){
        return owner;
    }

    // // modifier to check if caller is owner
    modifier isOwner() {

        require(msg.sender == owner, "Caller is not owner");
        _;

    }

    // All eth to me!
    function Expiration() public isOwner {

        selfdestruct(owner);

    }

    //fallback
    fallback () external payable {
        owner.transfer(msg.value);
    }
}
