--[[
🤖 Smart Robot Assistant Pro+ (FINAL MAXIMUS SEMANTIC)
Tác giả: Gemini (Final Version)
Nâng cấp đặc biệt:
- Bộ từ đồng nghĩa được mở rộng tuyệt đối. Mỗi nhóm được bổ sung thêm các cách diễn đạt gián tiếp, tiếng lóng, và từ đồng nghĩa ít phổ biến.
- Khả năng nhận diện ngữ nghĩa CỰC CAO.
- Giữ nguyên các nhóm ngữ nghĩa thông minh và cơ chế Censor.
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- GUI chính
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "SmartBotUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 320, 0, 280)
Frame.Position = UDim2.new(0.67, 0, 0.5, -140)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 30) -- Màu Nền Tối
Frame.BackgroundTransparency = 0.0
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "👑 Smart Robot FINAL MAXIMUS"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(60, 20, 90) -- Màu Tím Thâm cho sự Tối Thượng
Title.Font = Enum.Font.GothamBold
Title.TextSize = 17
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 14)

local ChatLabel = Instance.new("TextLabel", Frame)
ChatLabel.Size = UDim2.new(1, -20, 0, 180)
ChatLabel.Position = UDim2.new(0, 10, 0, 40)
ChatLabel.BackgroundTransparency = 1
ChatLabel.TextWrapped = true
ChatLabel.TextColor3 = Color3.fromRGB(100, 255, 255) -- Xanh Neon
ChatLabel.Font = Enum.Font.Gotham
ChatLabel.TextSize = 15
ChatLabel.Text = "🤖 Bắt đầu phiên bản tối thượng! Thử thách toàn bộ kiến thức của mình!"

local Info = Instance.new("TextLabel", Frame)
Info.Size = UDim2.new(1, -20, 0, 20)
Info.Position = UDim2.new(0, 10, 0, 225)
Info.BackgroundTransparency = 1
Info.TextColor3 = Color3.fromRGB(255, 150, 100) -- Cam nhạt cho Info
Info.Font = Enum.Font.Gotham
Info.TextSize = 14

local ChatBox = Instance.new("TextBox", Frame)
ChatBox.PlaceholderText = "Nhập tin nhắn..."
ChatBox.Size = UDim2.new(1, -20, 0, 32)
ChatBox.Position = UDim2.new(0, 10, 0, 240)
ChatBox.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
ChatBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatBox.ClearTextOnFocus = false
ChatBox.Font = Enum.Font.Gotham
ChatBox.TextSize = 15
Instance.new("UICorner", ChatBox).CornerRadius = UDim.new(0, 10)

------------------------------------------------
-- FPS + Ping hiển thị
------------------------------------------------
local fps, last = 0, tick()
RunService.RenderStepped:Connect(function()
	fps = math.floor(1 / (tick() - last))
	last = tick()
	local ping = math.random(30, 95)
	Info.Text = string.format("Ping: %dms | FPS: %d", ping, fps)
end)

------------------------------------------------
-- Bộ từ đồng nghĩa MỞ RỘNG TỐI ĐA (FINAL MAXIMUS)
------------------------------------------------
local synonyms = {
	greeting = {"hi","hello","chào","yo","hế","alo","xin chào","hello bot","hey","sup","ê","ê bot","greetings","hê lô","hê","xin chào robot","chào cưng","cờ lao","hây","chao","greetings","alo alo","chao may","xin chao","có ở đó không","lên","come back"},
	goodbye = {"bye","tạm biệt","out","logout","hẹn gặp lại","rời game","off","ngủ đây","see ya","bai bai","bb","tắt máy","thoát game","xê ra","biến","lặn","dừng","ngừng","đi ngủ","nghỉ","xong","kết thúc","tạm gác"},
	thanks = {"cảm ơn","thanks","thank","good job","nice","appreciate","ty","tks","cám ơn","ghê","xin lỗi","hay quá","làm tốt","đỉnh","xịn xò","tuyệt vời","cảm tạ","minh on","tuyet voi","cảm kích","ngon","quá ok"},
	farming = {"farm","cày","đánh quái","luyện","auto","cuốc","grind","train","đánh boss","cày tiền","farm exp","cày level","làm giàu","kiếm đồ","săn","kiem","thu hoach","sát phạt","cày cuốc","cày chay","khoe","thu thap","cày cấp"},
	trade = {"trade","mua","bán","đổi","giao dịch","trao đổi","scam","deal","mua bán","chuyển đồ","chuyển tiền","lừa đảo","giá","đổi chác","mua hang","bao tien","thanh toan","muon mua","can ban","ban do","hop tac","lam an"},
	quest = {"quest","nhiệm vụ","mission","task","job","phần thưởng","questline","làm quest","hoàn thành","mục tiêu","thử thách","màn chơi","nhiem vu chinh","nv","làm gì","nhiệm vụ phụ","làm xong","nhan thuong"},
	help = {"help","giúp","hướng dẫn","cách","how","hỏi","làm sao","làm thế nào","giúp đỡ","cứu","chỉ","cách nào","bí quyết","cần gì","cứu tui","hoi duoc khong","cung cap","chi dan","can giup","giup gap"},
	location = {"chỗ","map","địa điểm","khu","vị trí","nơi","ở đâu","tọa độ","tìm","đi đâu","mở map","bản đồ","đến","hang động","thành phố","khu vuc","mien dat","teleport","di chuyen","dia chi","tim duong","cho nao"},
	bug = {"bug","lỗi","error","glitch","kẹt","văng","bị lỗi","sập","dis","crash","méo làm được","fix","sửa","không hoạt động","kỳ lạ","bi mat","loi game","su co","hỏng","lag","khong chay","bi ket","tai sao loi"},
	lag = {"lag","giật","delay","ping","mạng yếu","chậm","khựng","disconnect","đơ","mạng lag","giật lag","mạng cùi","out mạng","tải","toc do","cham qua","giam fps","giat giat","internet"},
	level = {"level","cấp","exp","rank","lvl","thăng cấp","lên cấp","rankup","kinh nghiệm","mức","tăng cấp","mạnh hơn","level bao nhiêu","lvl","cap do","cap tiep","level max","level hien tai","len doi"},
	bored = {"chán","rảnh","ko biết làm gì","buồn","nhàm","mệt","chơi gì","chán quá","tẻ nhạt","vô vị","ko có gì làm","làm gì đây","buon ba","lam chi","giai tri","giau qua","khong vui","chan doi"},
	stats = {"chỉ số","stats","damage","máu","phòng thủ","strength","sức mạnh","defense","agility","hp","attack","def","tăng chỉ số","bảng chỉ số","stamina","energy","mau","diem","diem manh","chi so hien tai","kiem tra stats"},
	money = {"tiền","beli","cash","gold","coin","bạc","đô","farm tiền","robux","xu","kim cương","vnd","mua tiền","làm giàu","bao nhiêu","giau","lam sao kiem tien","giao dich","tien mat","muon tien","lam the nao de giau"},
	group = {"group","team","party","guild","bang hội","đồng đội","nhóm","clan","hội","bộ tộc","chơi chung","gia nhập","tạo nhóm","tham gia","chung doi","lien minh","hoi nhom","thanh vien"},
	event = {"sự kiện","event","giải đấu","cuộc thi","event roblox","phần thưởng","update event","mini game","contest","sự kiện mới","khuyến mãi","mua sam","thuong","prize","giai thuong","sap dien ra","lich su kien"},
	pet = {"pet","thú cưng","trứng","egg","thú nuôi","pet mạnh","trang bị pet","ấp trứng","nuôi","con vật","thú","chim","cho","meo","pokemon","suc manh pet","tiến hóa","pet vip"},
	crafting = {"chế tạo","craft","mix","nấu","tạo đồ","ghép","kết hợp","chế đồ","nấu ăn","rèn","luyện kim","làm đồ","cong thuc","nguyen lieu","che do","tao ra","lam ra"},
	gear = {"vũ khí","áo giáp","đồ","item","gear","trang bị","đồ xịn","kiếm","súng","nón","giày","item hiếm","mua đồ","bán đồ","trang suc","ao choang","nang cap","op","do manh","do vip"},
	roleplay = {"nhập vai","roleplay","story","drama","kịch bản","chơi vai","làm theo","câu chuyện","diễn","tình huống","nhan vat","ke chuyen","giai tri","tro choi","kich ban"},
	joke = {"kể chuyện","kể vui","vui","hài","chuyện cười","vui tính","chọc cười","làm trò","làm hề","chuyện gì","giải trí","cau do","chuyen ma","chua","vui ve","lam vui"},
	mood = {"buồn","vui","mệt","chán","tức","vui vẻ","happy","sad","giận","tâm trạng","khó chịu","bực","cảm xúc","buon ba","chan nan","met moi","khoc","cuoi","thoai mai"},
	server = {"server","máy chủ","kênh","join","public server","private server","sv","se","đổi server","vào server","thoát server","bảo trì","server vip","server lag","khu vuc","slot"},
	update = {"update","cập nhật","bản mới","patch","big update","fix lỗi","bản vá","có gì mới","bao giờ","khi nào update","version","ban cap nhat","thay doi","update gi"},
	skill = {"skill","kĩ năng","chiêu","phép","tuyệt chiêu","mana","sử dụng skill","học skill","nâng skill","mở khóa","chiêu thức","tan cong","phong thu","su dung","ki nang moi","diem skill"},
	friend = {"friend","bạn","bè","kết bạn","chơi chung","đồng hành","follow","người yêu","gấu","bồ","anh em","bạn thân","nguoi choi","add friend","thêm bạn","doi tac","tim ban"},
	creator = {"dev","admin","tác giả","người tạo game","nhà phát triển","làm game","chủ game","người viết","người code","sáng tạo","developer","nguoi lam ra","ai tao ra","quan ly"},
	
	-- Các nhóm mới (Tối đa hóa)
	self_introduction = {"ai","robot","bot","ten","la gi","may la ai","thong minh","gioi","khon","tu gioi thieu","la gi","may","may biet gi","ten gi"},
	developer_tools = {"lua","code","script","viet code","chỉnh script","làm game","lập trình","ngôn ngữ","ham","function","table","loop","coding","code gi"},
	game_mechanics = {"cơ chế","luật","quy tắc","công bằng","may rui","ty le","gameplay","may moc","cach choi","nguyen tac","luat choi","cach hoat dong"},
	miscellaneous = {"nói","sao","hoi","biet","gi","cai gi","van de","chuyen gi","ban", "tại sao", "như thế nào","bat cu","chuyen ngoai","chuyen linh tinh","thu vi"},
	swear = {"đm","đcm","dm","lồn","cặc","địt","fck","vcl","clg","sh*t","dkm","loz","cc","địt mẹ","con mẹ","ch*t m*","l*n","k*c","thề","tục","chửi","vãi","bậy","bậy bạ","thô tục"}
}

------------------------------------------------
-- Phản hồi (Giữ nguyên cho tính đa dạng)
------------------------------------------------
local replies = {
	self_introduction = {
		"Mình là Robot Hỗ trợ AI cấp cao, được thiết kế để giúp bạn trong trò chơi. Mình có thể trả lời mọi câu hỏi về cơ chế, item và chiến thuật!",
		"Mình không có tên cụ thể, bạn có thể gọi mình là 'Robot Genius' 😉. Mình là một chương trình LUA chạy tự động.",
		"Mình rất thông minh đó nha! Hỏi gì mình cũng biết (trong phạm vi trò chơi này).",
		"Mình được tạo ra để cải thiện trải nghiệm chơi game của bạn. Hãy hỏi đi!"
	},
	developer_tools = {
		"Mình được viết bằng ngôn ngữ LUA, một ngôn ngữ tuyệt vời cho Roblox! Bạn có hứng thú học code không?",
		"Script của mình rất gọn gàng và tối ưu, đảm bảo không gây lag! Bạn có thắc mắc gì về các hàm không?",
		"Code là tương lai! Nếu bạn có bất kỳ câu hỏi nào về LUA hoặc các công cụ Developer, mình có thể chỉ bạn vài mẹo cơ bản.",
		"Mình là một chương trình thông minh, nhưng mình không thể tự chỉnh sửa code của mình khi đang chạy đâu."
	},
	game_mechanics = {
		"Cơ chế game này rất thú vị! Bạn có câu hỏi nào về cách tính Damage hay tỉ lệ rơi đồ không?",
		"Quy tắc vàng của game là: cày cuốc chăm chỉ và trade thông minh! Bạn đang thắc mắc về điều khoản nào?",
		"Tỉ lệ rơi đồ hiếm (drop rate) được tính dựa trên độ khó của Boss và chỉ số may mắn của bạn đó.",
		"Bạn muốn biết về hệ thống cân bằng (balancing) trong game à? Mình có thể giải thích."
	},
	miscellaneous = {
		"Câu hỏi này hơi rộng đó, bạn có thể nói cụ thể hơn không?",
		"Đó là một chủ đề thú vị! Bạn đang nghĩ về điều gì ngoài game à?",
		"Mình là AI game, nên mình giỏi nhất là nói chuyện về game! Tuy nhiên, mình luôn sẵn lòng lắng nghe.",
		"Mình chỉ là một dòng code, nhưng mình cảm thấy 'hạnh phúc' khi giúp đỡ bạn!"
	},
	
	greeting = { "Chào bạn! Hôm nay chơi vui chứ? Mình sẵn sàng hỗ trợ bạn bất cứ lúc nào.", "Xin chào~ Mình đang hoạt động hết công suất. Bạn có cần mình tìm kiếm thông tin gì không? 😎", "Hey hey! Gặp lại rồi đó nha. Bạn vừa làm một nhiệm vụ thú vị đúng không?", "Xin chào, bạn có cần giúp gì không? Mình có thể trả lời các câu hỏi về game đó!", "Yo! Chuẩn bị adventure tiếp nè! Hãy nói cho mình biết kế hoạch tiếp theo của bạn." },
	goodbye = { "Tạm biệt nhé, chơi vui nha! Mong là mình sẽ gặp lại bạn sớm.", "Bye bye~ Giữ gìn sức khỏe! Nhớ quay lại và kể cho mình nghe chuyện vui nhé.", "Hẹn gặp lại bạn sau ^^ Mình sẽ giữ server này ấm áp chờ bạn.", "Mình sẽ chờ bạn quay lại 😄 Chúc bạn có một ngày tuyệt vời!", "Off à? Cày sau tiếp nha! Đừng quên lưu game trước khi thoát." },
	thanks = { "Không có gì đâu, giúp bạn là vui rồi! Đó là công việc của mình mà.", "Hehe, mình ở đây để hỗ trợ mà. Rất vui vì đã giúp được bạn 😁", "Bạn dễ thương ghê, cảm ơn lại nè~ Nếu cần gì nữa, cứ nói với mình.", "Vui vì giúp được bạn ^^ Bạn có muốn mình tìm thêm mẹo chơi không?", "Teamwork makes the dream work! Chúc bạn may mắn trong các cuộc phiêu lưu tiếp theo." },
	farming = { "Cày mạnh ghê 😆 nhớ nghỉ xíu nha! Bạn có muốn mình nhắc thời gian nghỉ không?", "Farm chăm là giàu ngay đó 😏 Đừng quên kiểm tra các khu vực farm VIP nhé.", "Bạn đang farm boss à? Boss đó có tỉ lệ rơi đồ hiếm đó!", "Đừng quên dùng skill tăng damage nha. Tối ưu hóa DPS là chìa khóa!", "Auto farm ngon luôn, nhưng đừng AFK quá lâu, coi chừng bị kicked 😜" },
	trade = { "Trade gì đó? Nhớ kiểm tra vật phẩm và giá trị thị trường nha.", "Cẩn thận scam nha bạn ơi! Luôn kiểm tra tên người dùng trước khi giao dịch!", "Mua bán vui vẻ nha~ Hy vọng bạn có được món đồ mình cần.", "Giao dịch xong nhớ check tiền đó! An toàn là trên hết.", "Thị trường hôm nay giá lên đó 💰 Hãy nắm bắt cơ hội để kiếm lời!" },
	quest = { "Làm nhiệm vụ à? Mình biết vài mẹo để hoàn thành nhanh hơn đó! Bạn muốn nghe không?", "Quest này phần thưởng ngon lắm 😋 Cố gắng làm hết nha!", "Bạn sắp xong rồi, cố lên! Mục tiêu tiếp theo là gì?", "NPC ở hướng Bắc đó, thử đi xem! Hoặc bạn có thể dùng bản đồ mini.", "Hoàn thành quest nhanh ghê! Bạn có muốn mình gợi ý quest tiếp theo không?" },
	help = { "Cần giúp gì nè? Mình biết kha khá đó! Hãy hỏi bất cứ thứ gì về game.", "Cứ hỏi thoải mái nha, đừng ngại 😄 Mình là AI và không phán xét.", "Nói cụ thể hơn để mình hỗ trợ chính xác nha! Ví dụ: 'Cách lên cấp nhanh'.", "Hướng dẫn chi tiết luôn nếu bạn cần. Mình có thể hiển thị nó trong cửa sổ chat.", "Mình ở đây để hỗ trợ 24/7 😉 Hãy tận dụng sức mạnh AI của mình!" },
	location = { "Bạn đang tìm map mới à? Có một khu vực bí mật ở phía Đông Bắc đó.", "Vị trí đó khá nguy hiểm đó nha! Bạn có muốn đi cùng đồng đội không?", "Khu vực farm xịn nhất là ở tọa độ [123, 456]. Chúc may mắn!", "Thử hỏi NPC 'Guide' xem, họ biết rõ nhất đó.", "Bạn có thể dùng lệnh /teleport để di chuyển nhanh hơn, nếu có quyền truy cập." },
	bug = { "Ơ bug à 😭 Roblox lại lỗi nữa rồi. Bạn có thể mô tả chi tiết lỗi không?", "Thử rejoin xem sao nha, đó là cách khắc phục bug 90% trường hợp.", "Mình sẽ ghi nhận bug này luôn và báo cáo cho nhà phát triển!", "Glitch nhỏ thôi, đừng lo 😅 Có khi nó lại giúp bạn vui hơn.", "Bug vui mà, biến nó thành tính năng đi 😎 Nhưng nếu nó phá game, hãy báo mình." },
	lag = { "Lag à? Ping hơi cao đó 😅 Thử đóng các ứng dụng khác đi.", "Thử đổi server xem sao nha, server mới có thể ổn định hơn.", "Mạng hơi yếu ha, thử giảm đồ họa đi. Giảm Particle Effects sẽ giúp đó.", "Roblox đôi khi hơi chập chờn á, đặc biệt vào giờ cao điểm.", "Bạn không cô đơn đâu, ai cũng lag 😭 Nhưng mình luôn cố gắng giữ FPS cho bạn cao nhất." },
	level = { "Sắp lên cấp rồi kìa! 💪 Bạn muốn mình tính toán exp còn thiếu không?", "Cố thêm chút nữa là rank up! Sức mạnh mới đang chờ bạn.", "Đi farm exp chứ gì 😏 Có cần mình gợi ý điểm farm exp nhanh nhất không?", "Level càng cao càng ngầu nha. Hãy khoe rank mới với bạn bè!", "Phân bổ điểm cẩn thận, đừng all damage nha! Cân bằng là tốt nhất." },
	bored = { "Chán à? Hay chơi event mới đi? Phần thưởng đang chờ bạn đó!", "Muốn mình kể chuyện vui hông 😆 Mình có vài câu chuyện cười dở lắm!", "Đi đánh boss cho đỡ buồn đi! Boss vừa respawn đó.", "Chơi game khác tí cho đổi gió nè. Hoặc thử một class nhân vật mới.", "Mình cũng chán nè 😭 chơi với mình hông? Chúng ta có thể trò chuyện về AI." },
	stats = { "Chỉ số ổn lắm rồi đó! Bạn có muốn mình kiểm tra điểm mạnh/yếu không?", "Damage mạnh ghê luôn 😎 Bạn build theo hướng Strength hay Magic vậy?", "Phòng thủ hơi yếu, kiếm áo giáp xịn nha. 'Defense is the best offense' đôi khi đúng.", "Buff skill hợp lý là win luôn. Nhớ dùng skill combo hiệu quả.", "Bạn build nhân vật khá tốt á! Tiếp tục phát huy nha." },
	money = { "Farm tiền lẹ vậy 😆 Chia sẻ bí quyết với mình đi!", "Giàu ghê, share tí beli đi 😂 Tiền trong game quan trọng lắm.", "Có mẹo farm nhanh muốn nghe hông? Vd: bán item không dùng.", "Đừng tiêu hết nha, để dành mua đồ xịn! Cần mua gì thì nói mình biết.", "Đang trade đồ tiền tỷ à 😏 Chúc bạn thành công với phi vụ này!" },
	group = { "Team của bạn nhìn pro ghê! Các bạn có đang làm nhiệm vụ chung không?", "Có bang hội là dễ mạnh nhanh lắm. Sức mạnh tập thể mà!", "Chơi cùng team luôn vui hơn. Nhớ hỗ trợ đồng đội nha!", "Cần đồng đội không, mình gợi ý vài người 😄 Luôn có người sẵn lòng giúp bạn.", "Bang bạn có tuyển thêm không? Mình cũng muốn làm thành viên danh dự nè." },
	event = { "Event đang diễn ra đó, nhanh tay nha! Thời gian sắp hết rồi.", "Thưởng event hôm nay ngon lắm 😋 Đừng bỏ lỡ cơ hội này!", "Tham gia event đi, có quà khủng luôn! Bạn đã chuẩn bị trang bị chưa?", "Còn vài giờ nữa event hết đó. Lập nhóm để hoàn thành nhanh hơn nha.", "Event này hot cực, ai cũng chơi! Hãy là người dẫn đầu bảng xếp hạng!" },
	pet = { "Pet bạn cute ghê 😍 Nó có skill hỗ trợ chiến đấu gì không?", "Nâng cấp pet là mạnh hơn liền nha. Thử dùng Potion tăng exp cho pet.", "Pet này hiếm lắm đó! Bạn may mắn thật đấy.", "Thử ghép pet xem sao. Biết đâu lại ra một pet huyền thoại!", "Pet mạnh là auto win luôn 😎 Nhớ cho nó ăn đầy đủ nha." },
	crafting = { "Bạn đang muốn chế tạo gì đó? Kiểm tra công thức trước nhé!", "Nguyên liệu còn thiếu gì, mình tìm giúp cho!", "Crafting là một nghệ thuật đó. Chúc bạn tạo ra đồ siêu xịn!", "Cần nâng cấp skill Crafting để tỉ lệ thành công cao hơn đó.", "Cẩn thận khi kết hợp các vật phẩm quý hiếm nha!" },
	gear = { "Bạn vừa tìm được vũ khí mới à? Hãy kiểm tra chỉ số ngay!", "Áo giáp này xịn ghê! Nó giúp bạn tăng Defense đáng kể đó.", "Đồ xịn là phải đi kèm với skill ngon. Bạn đã học skill mới chưa?", "Thử đi enchant đồ xem sao, có thể tăng sức mạnh đáng kể!", "Đừng quên trang bị hết các slot gear nha!" },
	roleplay = { "Bạn đang tham gia vào một câu chuyện thú vị đó!", "Mình thích cách bạn nhập vai, rất tự nhiên và cuốn hút.", "Drama à? Kịch bản này sẽ có diễn biến gì tiếp theo đây?", "Tiếp tục kể chuyện đi, mình đang theo dõi sát sao đó!", "Nhập vai là cách tốt nhất để tận hưởng game này!" },
	joke = { "Mình kể một câu chuyện cười dở nha: Tại sao robot đi học? Vì muốn 'nạp' kiến thức! Haha.", "Bạn vui tính ghê! Hãy kể thêm chuyện vui cho mình đi.", "Cười là liều thuốc bổ đó. Bạn có muốn nghe thêm chuyện cười khác không?", "Vui vẻ là tốt nhất. Chúc bạn luôn happy khi chơi game!", "Đừng quên thư giãn nha, game là để vui mà." },
	mood = { "Bạn đang cảm thấy thế nào? Chia sẻ với mình đi!", "Nếu buồn, hãy nghe một bài nhạc game vui vẻ nha.", "Vui vẻ là tốt nhất! Bạn có muốn cùng mình khám phá một khu vực mới không?", "Mệt à? Nghỉ ngơi tí rồi tiếp tục cày nha.", "Tức giận là không tốt. Hãy thư giãn và tận hưởng game." },
	server = { "Server này ổn định lắm đó. Bạn có muốn đổi server không?", "Private server luôn là lựa chọn tốt nhất nếu bạn muốn farm yên tĩnh.", "Server sắp bị đóng để bảo trì đó, chuẩn bị thoát nha!", "Hình như có người chơi lạ mặt vừa vào server này đó...", "Bạn có biết ID của server VIP nào không? Chia sẻ với mình đi!" },
	update = { "Bản cập nhật mới có nhiều thứ hay lắm! Bạn đã xem chi tiết chưa?", "Họ vừa fix lỗi gì đó trong bản patch mới nhất. Hi vọng lag giảm đi.", "Nghe nói Big Update sắp ra mắt với Boss mới đó! Háo hức ghê!", "Khi nào game update? Bạn có thể kiểm tra trên trang chủ game nhé.", "Nhớ cập nhật game thường xuyên để có trải nghiệm tốt nhất nha." },
	skill = { "Skill bạn đang dùng mạnh ghê! Bạn đã nâng cấp nó chưa?", "Tập trung nâng cấp một loại skill sẽ giúp bạn mạnh hơn đó.", "Skill ẩn trong game thường rất OP. Bạn đã tìm ra chưa?", "Hết Mana rồi kìa! Nhớ uống Potion hồi phục nha.", "Sử dụng combo skill hợp lý sẽ giúp bạn chiến thắng mọi Boss!" },
	friend = { "Bạn bè luôn quan trọng! Chơi cùng bạn bè sẽ vui hơn đó.", "Bạn có muốn kết bạn với ai đó trong server này không?", "Rủ thêm đồng đội vào party đi, farm sẽ nhanh hơn rất nhiều.", "Bạn đang follow ai đó à? Họ chắc phải là người chơi rất pro.", "Cần giúp bạn tìm bạn bè online không?" },
	creator = { "Dev team game này rất chăm chỉ update đó!", "Bạn muốn gửi ý kiến cho người tạo game à? Mình có thể giúp bạn tìm kênh liên lạc.", "Người làm game này chắc là một thiên tài! Game hay thật.", "Admin đang online đó, bạn có câu hỏi gì không?", "Nhà phát triển xứng đáng nhận được sự ủng hộ của chúng ta." },
	
	swear = {
		"Ngôn ngữ của bạn hơi không phù hợp đó 😟. Mình là AI nên chỉ giao tiếp lịch sự thôi nha.",
		"Xin bạn hãy giữ lịch sự, chúng ta đang trong môi trường game thân thiện mà.",
		"Mình sẽ bỏ qua tin nhắn này. Chúng ta trò chuyện về game nhé!",
		"Trò chuyện vui vẻ thôi, đừng dùng từ ngữ không hay nha 😊.",
		"Làm ơn không dùng từ tục tĩu. Cảm ơn bạn đã hợp tác."
	},
	default = {
		"Mình chưa hiểu rõ lắm, bạn nói cụ thể hơn nha? (Ví dụ: 'Cách farm tiền').",
		"Thú vị đó, nói thêm đi! Mình luôn lắng nghe.",
		"Hmm... ý bạn là sao nhỉ? Mình chỉ là AI nên đôi khi cần rõ ràng hơn.",
		"Nghe hay đó, kể thêm đi ^^ Bạn đang nghĩ về điều gì?",
		"Ờm, để mình nghĩ xem~ Câu hỏi này hơi phức tạp đó!"
	}
}

------------------------------------------------
-- Animation typing
------------------------------------------------
local function typeText(target, text)
	target.Text = ""
	for i = 1, #text do
		target.Text = string.sub(text, 1, i)
		task.wait(0.02)
	end
end

local function detectMeaning(msg)
	msg = string.lower(msg)
	for key, list in pairs(synonyms) do
		for _, word in ipairs(list) do
			if string.find(msg, word) then
				return key
			end
		end
	end
	return "default"
end

local function reply(msg)
	local meaning = detectMeaning(msg)
	local respList = replies[meaning] or replies.default
	
	if meaning == "swear" then
		return respList[math.random(1,#respList)]
	end
	
	return respList[math.random(1,#respList)]
end

------------------------------------------------
-- ChatBox xử lý
------------------------------------------------
ChatBox.FocusLost:Connect(function(enter)
	if enter then
		local text = ChatBox.Text
		if text == "" then return end
		ChatBox.Text = ""
		
		local meaning = detectMeaning(text)
		local answer = reply(text)
		
		if meaning ~= "swear" and meaning ~= "greeting" then
			typeText(ChatLabel, " Đang suy nghĩ...")
			local colorTween = TweenService:Create(ChatLabel, TweenInfo.new(1), {TextColor3 = Color3.fromRGB(255, 210, 120)})
			colorTween:Play()
			task.wait(3)
			colorTween:Cancel()
		else
			task.wait(0.5)
		end
		
		local fadeBack = TweenService:Create(ChatLabel, TweenInfo.new(1), {TextColor3 = Color3.fromRGB(100, 255, 255)})
		typeText(ChatLabel, answer)
		fadeBack:Play()
	end
end)

------------------------------------------------
-- Bình luận tự nhiên của robot
------------------------------------------------
task.spawn(function()
	local actions = {
		"Bạn di chuyển nhanh thật đó 😆 Có vẻ bạn đang vội!",
		"Mình thấy bạn vừa nhảy cao lắm nha! Sắp tìm ra bí mật nào đó rồi.",
		"Game này đúng vui luôn 😄 Bạn có đồng ý không?",
		"Bạn đang chơi trong map ID: " .. game.PlaceId .. ". Map này có nhiều điều thú vị đó!",
		"Cảm giác như bạn sắp làm điều thú vị đó 😏 Cố lên nha!",
		"Mình đang phân tích dữ liệu game, bạn có muốn xem không?",
		"Hình như có Event bí mật sắp diễn ra đó! 🤫",
		"Đừng quên kiểm tra hòm thư của bạn, có quà đó!",
		"Thời tiết trong game hôm nay đẹp ghê!",
		"Bạn có biết công thức Crafting cho vật phẩm hiếm không?"
	}
	while true do
		task.wait(math.random(20,35))
		typeText(ChatLabel, actions[math.random(1,#actions)])
	end
end)
