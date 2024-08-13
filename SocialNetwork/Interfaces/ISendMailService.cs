using SocialNetwork.Controllers;
using SocialNetwork.DTO.MailDTOs;
using MailContent = SocialNetwork.DTO.MailDTOs.MailContent;

namespace SocialNetwork.Interfaces
{
    public interface ISendMailService
    {
        Task SendMail(MailContent mailContent);

        Task SendEmailAsync(string email, string subject, string htmlMessage);
    }
}
