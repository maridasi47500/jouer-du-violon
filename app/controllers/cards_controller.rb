class CardsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @cards = @post.cards
  end

  def new
    @post = Post.find(params[:post_id])
    @card = @post.cards.new
    @nuances = Nuance.all
  end

  def create
    @post = Post.find(params[:post_id])
    @card = @post.cards.new(card_params)
    if @card.save
      redirect_to @post, notice: 'Card ajoutée avec succès.'
    else
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:nuance_id, :mesure)
  end
end

