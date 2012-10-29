class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    @game = Game.find(1)
    r = Random.new
    @number_a = r.rand(0..9)
    @number_b = r.rand(0..9)
    @res = @number_a * @number_b
    $question = Question.create!(number_a: @number_a, number_b: @number_b, correct_result: @res, game_id:@game.id)
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    @question.number_a = $question.number_a
    @question.number_b = $question.number_b
    @question.correct_result = $question.correct_result
    @question.game_id = $question.game_id
    @question.save
    
    
    respond_to do |format|
      if @question.save
        if @question.your_result == @question.correct_result
        Ledger.create!(cents:1, user_id: current_user.id)
        format.html { redirect_to new_question_path, notice: 'Question was correctly ANSWERED! YEAH!!! You made 1 cent.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        Ledger.create!(cents:-1)
        format.html { redirect_to @question, notice: 'Your answer was WRONG! You lost 1 cent.' }
        format.json { render json: @question, status: :created, location: @question }
      end
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
end
