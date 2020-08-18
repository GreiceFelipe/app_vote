class VotesController < ApplicationController
    before_action :set_votes, only: [:update]


    def create
        @vote = Vote.new(vote_params)

        render json: @vote and return if @vote.save

        render json: @vote.errors, status: :unprocessable_entity
    end

    def update
        render json: @vote and return if @vote.update(vote_params)

        render json: @vote.errors, status: :unprocessable_entity
    end

    private

    def vote_params
        params.require(:vote).permit(:option_id, :campaign_id, :voter)
    end

    def set_votes
        @vote = Vote.find(params[:id]) 
    end

end
