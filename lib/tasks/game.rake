

# Run this using rake game:like[55, 127.0.0.1]
namespace :game do
  task :like, [:game_id, :ip] => :environment do |task,args|
    like = Like.new

    most_recent = Like.where(:game_id => args.game_id, :ip_address => args.ip).last
    if (!most_recent.nil? && most_recent.liked_at > 5.minutes.ago)
      abort 'Task failed due to duplicate like prevention.'
    end
    like.game_id = args.game_id
    like.ip_address = args.ip
    like.game_title = Game.find(args.game_id).name
    like.liked_at = Time.now
    like.save
    puts like.game_title + ' was liked!'
    puts 'Total likes: ' + Like.where(:game_id => args.game_id, :ip_address => args.ip).count.to_s
    # you can remove the two "puts" if you want to, they just test that the args are working.
    # puts args.game_id
    # puts args.ip
  end
end
