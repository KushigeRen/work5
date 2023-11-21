##ゲーム終了フラグ 0(未) 1(済)
flag = 0

##-----じゃんけん-----
##じゃんけんの勝敗
result = ""

1.times do
    if result == "draw"
        puts "あいこで..."
    else
        puts "じゃんけん..."
    end
    puts "1(グー) 2(チョキ) 3(パー) 4(戦わない)"

    ##自分の手を決める
    you = gets.to_i

    ##戦わない・不正な入力の時の処理
    if you == 1 || you == 2 || you == 3
        #処理なし
    elsif you == 4
        puts "やっぱりやめておきましょう..."
        puts "じゃんけんを終了します"
        exit
    else
        puts "1~4の値を入力してください"
        redo
    end

    ##相手の手を決める
    opponent = Random.rand(1..3)

    ##数字を手に変換
    def num_to_hand(num)
        case num
        when 1
            hand = "グー"
        when 2
            hand = "チョキ"
        when 3
            hand = "パー"
        end
        return hand
    end

    ##ターミナル出力
    puts "ぽん！"
    puts "--------------------"
    puts "あなた：#{num_to_hand(you)}を出しました"
    puts "相手：#{num_to_hand(opponent)}を出しました"
    puts "--------------------"

    ##じゃんけん勝敗パターン
    if you == 1
        case opponent
        when 1
            result = "draw"
        when 2
            result = "win"
        when 3
            result = "lose"
        end
    elsif you == 2
        case opponent
        when 1
            result = "lose"
        when 2
            result = "draw"
        when 3
            result = "win"
        end
    elsif you == 3
        case opponent
        when 1
            result = "win"
        when 2
            result = "lose"
        when 3
            result = "draw"
        end
    end

    ##じゃんけんの結果出力
    if result == "win"
        puts "じゃんけんに勝った！"
    elsif result == "lose"
        puts "じゃんけんに負けた..."
    else
        redo
    end




    ##-----あっち向いてホイ-----
    1.times do
        puts "あっち向いて..."

        ##自分の手を決める/自分が向く方向を決める
        puts "1(上) 2(右) 3(下) 4(左)"
        you = gets.to_i

        ##不正な入力の時の処理
        if you == 1 || you == 2 || you == 3 || you == 4
            #処理なし
        else
            puts "1~4の値を入力してください"
            redo
        end

        ##相手の手を決める
        opponent = Random.rand(1..4)

        ##数字を顔の向きに変換
        def num_to_direction(num)
            case num
            when 1
                direction = "上"
            when 2
                direction = "右"
            when 3
                direction = "下"
            when 4
                direction = "左"
            end
            return direction
        end

        ##ターミナル出力
        puts "ほい！"
        puts "--------------------"
        puts "あなた：#{num_to_direction(you)}"
        puts "相手：#{num_to_direction(opponent)}"
        puts "--------------------"

        ##勝敗判定
        if you == opponent && result == "win"
            puts "あなたの勝ちです！"
            flag = 1
        elsif you == opponent && result == "lose"
            puts "あなたの負けです..."
            flag = 1
        end
    end
    ##勝敗がつかなければ最初から
    if flag == 0
        redo
    end
end

